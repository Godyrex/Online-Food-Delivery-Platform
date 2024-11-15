import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {ChatCollection} from '../chat/chat.service';
import {catchError, map} from 'rxjs/operators';
import {observableToBeFn} from 'rxjs/internal/testing/TestScheduler';

export interface UserChatInfo {
  chatId: ChatCollection['id'];
  contactId: User['id'];
  contactName: User['name'];
  unread: number;
  lastChatTime: Date | string;
}

export class User {
  id: string;
  avatar: string;
  name: string;
  status: string;
  chatInfo?: UserChatInfo[];
}
@Injectable({
  providedIn: 'root'
})

export class ChatService {
  private readonly tokenUrl = 'http://localhost:8080/realms/food-delivery/protocol/openid-connect/token';
  private readonly userUrl = 'http://localhost:8099';
  private readonly keycloakUrl = 'http://localhost:8080/realms/food-delivery/protocol/openid-connect';
  public user: User;

  private apiUrl = 'http://localhost:8083/api/chat/messages';  // URL de l'API

  constructor(private http: HttpClient) { }

  // Récupérer les messages entre deux utilisateurs
  getMessages(senderId: string, receiverId: string): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${senderId}/${receiverId}`);
  }

  // Envoyer un message
  sendMessage(message: { senderId: string; receiverId: string; content: string; timestamp: Date }): Observable<any> {
    message.timestamp = new Date();  // Ajouter le timestamp actuel
    return this.http.post(this.apiUrl, message);
  }

  // Mettre à jour les messages comme lus
  updateMessagesAsRead(messageIds: string): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/messages/read`, { messageIds });
  }

  // Effacer la conversation
  clearChat(senderId: string, receiverId: string): Observable<any> {
    return this.http.delete(`${this.apiUrl}/clear/${senderId}/${receiverId}`);
  }
  getUserInfo() {
    console.log('get user info');
    return this.http.get(this.keycloakUrl + '/userinfo').pipe(
        map((response: any) => response.preferred_username), // Extracting preferred_username
        catchError(error => {
          console.error('Failed to fetch user info', error);
          return of(null); // Returning an observable with null on error
        })
    );
  }


}
