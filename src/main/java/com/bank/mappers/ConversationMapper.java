package com.bank.mappers;

import com.bank.dto.in.ConversationIn;
import com.bank.dto.out.ConversationOut;
import com.bank.models.Conversation;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring", uses={ConversationDirectionMapper.class, ConversationStatusMapper.class})
    public interface ConversationMapper {
    Conversation DTOtoEntity (ConversationIn conversationIn );
    ConversationOut entityToDTO (Conversation conversation );
}
