package com.bank.mappers;

import com.bank.dto.out.ConversationOut;
import com.bank.models.enums.ConversationDirection;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ConversationDirectionMapper {
    ConversationOut entityToDTO (ConversationDirection conversationDirection );
}
