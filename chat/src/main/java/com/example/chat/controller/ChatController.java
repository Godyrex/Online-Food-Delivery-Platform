package com.example.chat.controller;

import com.example.chat.model.Message;
import com.example.chat.service.ChatService;
import com.example.chat.service.NotificationService;
import com.example.chat.service.UserStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private UserStatusService userStatusService; // Service pour gérer le statut des utilisateurs

    // Envoi d'un message
    @PostMapping("/messages")
    public void sendMessage(@RequestBody Message message) {
        // Ajouter un timestamp si ce n'est pas déjà fait
        if (message.getTimestamp() == null) {
            message.setTimestamp(LocalDateTime.now());  // Ajouter le timestamp actuel
        }

        chatService.saveMessage(message);

        // Envoyer une notification au destinataire
        String notificationMessage = "Nouveau message de " + message.getSenderId();
        notificationService.sendNotification(message.getReceiverId(), notificationMessage);
    }

    // Récupérer les messages entre l'expéditeur et le destinataire
    @GetMapping("/messages/{senderId}/{receiverId}")
    public List<Message> getMessages(@PathVariable String senderId, @PathVariable String receiverId) {
        return chatService.getMessages(senderId, receiverId);
    }

    // Marquer les messages comme lus
    @PutMapping("/messages/read")
    public void markMessagesAsRead(@RequestBody String messageIds) {
        chatService.markMessagesAsRead(messageIds);
    }

    // Mettre à jour le statut en ligne ou hors ligne d'un utilisateur
    @PutMapping("/users/{userId}/status")
    public void updateUserStatus(@PathVariable String userId, @RequestParam boolean isOnline) {
        userStatusService.updateUserStatus(userId, isOnline);
    }

    // Récupérer le statut actuel d'un utilisateur
    @GetMapping("/users/{userId}/status")
    public boolean getUserStatus(@PathVariable String userId) {
        return userStatusService.getUserStatus(userId);
    }

    // Supprimer tous les messages entre l'expéditeur et le destinataire
    @DeleteMapping("/messages/clear/{senderId}/{receiverId}")
    public void clearChat(@PathVariable String senderId, @PathVariable String receiverId) {
        chatService.deleteAllMessages(senderId, receiverId);
    }


}
