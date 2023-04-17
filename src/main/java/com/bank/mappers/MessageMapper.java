package com.bank.mappers;

import com.bank.dto.in.MessageIn;
import com.bank.dto.out.MessageOut;
import com.bank.models.Message;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface MessageMapper {
    Message DTOtoEntity(MessageIn messageIn);

    MessageOut entityToDTO(Message message);
}
