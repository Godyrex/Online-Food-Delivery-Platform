package com.example.chat.service;



import org.springframework.stereotype.Service;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class UserStatusService {
    private final ConcurrentHashMap<String, Boolean> userStatusMap = new ConcurrentHashMap<>();

    // Met à jour le statut d'un utilisateur
    public void updateUserStatus(String userId, boolean isOnline) {
        userStatusMap.put(userId, isOnline);
    }

    // Récupère le statut actuel d'un utilisateur
    public boolean getUserStatus(String userId) {
        return userStatusMap.getOrDefault(userId, false);
    }
}
