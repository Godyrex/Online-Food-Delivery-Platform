package com.example.chat.controller;

import com.example.chat.model.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;

@Controller
public class WebSocketController {
    @MessageMapping("/sendMessage")
    @SendTo("/topic/public")
    public Message sendMessage(Message message) {
        message.setTimestamp(LocalDateTime.now());
        return message;
    }
}
