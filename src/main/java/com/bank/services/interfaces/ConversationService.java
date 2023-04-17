package com.bank.services.interfaces;

import com.bank.dto.in.ConversationIn;
import com.bank.dto.out.ConversationOut;
import com.bank.models.enums.ConversationDirection;

import java.util.List;

public interface ConversationService {
    ConversationOut create(ConversationIn conversationIn);

    List<ConversationOut> findAll();

    List<ConversationOut> findByConversationDirection(ConversationDirection.ConversationDirectionType conversationDirectionType);

    List<ConversationOut> findByCurrentUser();

    ConversationOut findById(Long id);

    ConversationOut changeStatus(Long id);
}
