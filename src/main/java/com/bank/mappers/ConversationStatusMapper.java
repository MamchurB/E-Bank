package com.bank.mappers;

import com.bank.dto.out.ConversationStatusOut;
import com.bank.models.enums.ConversationStatus;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ConversationStatusMapper {
    ConversationStatusOut entityToDto(ConversationStatus conversationStatus);
}
