package com.bank.services.interfaces;

import com.bank.dto.in.MessageIn;
import com.bank.dto.out.MessageOut;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface MessageService {
    MessageOut create(MessageIn messageIn);

    Page<MessageOut> findAllByConversationId(int pageNum, Long conversationId);
}
