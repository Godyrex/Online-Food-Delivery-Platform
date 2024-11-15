package com.example.chat.repository;

import com.example.chat.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findBySenderIdAndReceiverId(String senderId, String receiverId);

    // Method to mark messages as read
    @Modifying
    @Transactional
    @Query("UPDATE Message m SET m.isRead = true WHERE m.receiverId IN :messageIds")
    void markMessagesAsRead(@org.springframework.data.repository.query.Param("messageIds") List<Long> messageIds);
@Query("delete Message m  WHERE m.receiverId=receiverId and m.senderId=senderId ")
    void deleteBySenderIdAndReceiverId(String senderId, String receiverId);

}
