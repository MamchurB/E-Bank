package com.bank.repositories;

import com.bank.models.Conversation;
import com.bank.models.enums.ConversationDirection;
import com.bank.models.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ConversationRepository extends JpaRepository<Conversation, Long> {
    List<Conversation> findAllByConversationDirection(ConversationDirection conversationDirection);

    List<Conversation> findAllByUser(User user);
}