package com.example.chat.service;

import com.example.chat.model.Message;
import com.example.chat.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class ChatService {
    private static final Logger logger = LoggerFactory.getLogger(ChatService.class);

    @Autowired
    private MessageRepository messageRepository;

    public void saveMessage(Message message) {
        messageRepository.save(message);
    }

    public List<Message> getMessages(String senderId, String receiverId) {
        List<Message> messagesSent = messageRepository.findBySenderIdAndReceiverId(senderId, receiverId);
        List<Message> messagesReceived = messageRepository.findBySenderIdAndReceiverId(receiverId, senderId);
        List<Message> allMessages = new ArrayList<>();
        allMessages.addAll(messagesSent);
        allMessages.addAll(messagesReceived);
        allMessages.sort((m1, m2) -> m1.getTimestamp().compareTo(m2.getTimestamp()));
        return allMessages;
    }

    public void markMessagesAsRead(String messageIds) {
        List<Long> messageIdsList = Arrays.stream(messageIds.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        messageRepository.markMessagesAsRead(messageIdsList);
    }

    // Delete all messages between sender and receiver
    public void deleteAllMessages(String senderId, String receiverId) {
        // Log before the deletion
        logger.info("Attempting to delete messages between senderId: {} and receiverId: {}", senderId, receiverId);

        try {
            messageRepository.deleteBySenderIdAndReceiverId(senderId, receiverId);
            // Log after successful deletion
            logger.info("Successfully deleted messages between senderId: {} and receiverId: {}", senderId, receiverId);
        } catch (Exception e) {
            // Log if an error occurs
            logger.error("Error while deleting messages between senderId: {} and receiverId: {}", senderId, receiverId, e);
        }
    }
}
