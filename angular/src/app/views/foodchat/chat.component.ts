import { Component, OnInit } from '@angular/core';
import { ChatService } from '../foodchat/chat.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';


import {stringifyTask} from '@angular/compiler-cli/ngcc/src/execution/tasks/utils';
import {User} from '../chat/chat.service';
import {delayResponse} from 'angular-in-memory-web-api/delay-response';

@Component({
  selector: 'app-chat',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.css']
})
export class ChatComponent implements OnInit {
  user: any;
  response: any = this.chatService.getUserInfo();
  messages: any[] = [];
  messageContent = '';
  senderId = 'user4';
  receiverId = '';
  users = [
    { id: 'user1', name: 'User 1', unreadCount: 0 },
    { id: 'user2', name: 'User 2', unreadCount: 0 },
    { id: 'user3', name: 'User 3', unreadCount: 0 }
  ];
  unreadMessagesCount = 0;
  showNotifications = false;
  searchTerm = ''; // Valeur de recherche
  filteredUsers = this.users; // Liste filtrée des utilisateurs

  constructor(private chatService: ChatService) {}

  ngOnInit(): void {
    this.getMessages();
    this.chatService.getUserInfo().subscribe(
        response => {
          this.user = response;
        }
    );
    console.log('ahhhhhhhhhhhhhhhhh', this.user);
  }


  // Méthode de filtrage des utilisateurs
  filterUsers() {
    this.filteredUsers = this.users.filter(user =>
      user.name.toLowerCase().includes(this.searchTerm.toLowerCase())
    );
  }

  // Méthode pour afficher ou masquer les notifications
  toggleNotifications() {
    this.showNotifications = !this.showNotifications;
  }

  // Méthode pour sélectionner un destinataire
  selectReceiver(userId: string) {
    this.receiverId = userId;
    this.getMessages();
    this.markMessagesAsRead(userId);
  }

  // Récupérer les messages entre l’expéditeur et le destinataire
  getMessages() {
    if (this.receiverId) {
      this.chatService.getMessages(this.senderId, this.receiverId)
        .subscribe(
          (messages) => {
            this.messages = messages;
            this.checkForNewMessages(messages);
          },
          (error) => console.error('Erreur lors de la récupération des messages:', error)
        );
    }
  }

  // Effacer la conversation
  clearChat() {
    if (this.receiverId) {
      this.chatService.clearChat(this.senderId, this.receiverId).subscribe(
        () => {
          this.messages = []; // Vider les messages côté client
          console.log('Conversation supprimée avec succès');
        },
        (error) => console.error('Erreur lors de la suppression de la conversation:', error)
      );
    }
  }

  // Vérification des nouveaux messages non lus
  checkForNewMessages(messages: any[]) {
    const newMessages = messages.filter(message =>
      message.senderId !== this.senderId && !message.isRead
    );

    // Mettre à jour le compteur de messages non lus pour le destinataire
    // tslint:disable-next-line:no-shadowed-variable
    const user = this.users.find(user => user.id === this.receiverId);
    if (user) {
      user.unreadCount = newMessages.length;
    }

    // Mettre à jour le compteur global
    this.unreadMessagesCount = newMessages.length;
  }

  // Marquer les messages comme lus et réinitialiser le compteur
  markMessagesAsRead(userId: string) {
    // tslint:disable-next-line:no-shadowed-variable
    const user = this.users.find(user => user.id === userId);
    if (user) {
      user.unreadCount = 0;
    }

    this.chatService.updateMessagesAsRead(this.receiverId).subscribe(
      () => console.log('Messages marqués comme lus'),
      (error) => console.error('Erreur lors de la mise à jour des messages', error)
    );
  }

  // Fonction pour envoyer un message
  sendMessage() {
    if (this.messageContent.trim()) {
      const message = {
        senderId: this.senderId,
        receiverId: this.receiverId,
        content: this.messageContent,
        timestamp: new Date(),
        isRead: false
      };

      this.chatService.sendMessage(message).subscribe(
        () => {
          this.messages.push(message);
          this.messageContent = '';
          this.checkForNewMessages(this.messages);
        },
        (error) => console.error('Erreur lors de l\'envoi du message:', error)
      );
    }
  }

  // Fonction pour obtenir le nom de l'utilisateur ou "Vous" pour l'expéditeur
  getUserName(senderId: string): string {
    if (senderId === this.senderId) {
      return 'Vous';
    }
    // tslint:disable-next-line:no-shadowed-variable
    const user = this.users.find(user => user.id === senderId);
    return user ? user.name : 'Unknown';
  }

  // Méthode pour gérer l'événement focus sur l'input
  onFocus() {
    console.log('Input est focus');
  }

  // Méthode pour gérer l'événement blur sur l'input
  onBlur() {
    console.log('Input a perdu le focus');
  }
}
