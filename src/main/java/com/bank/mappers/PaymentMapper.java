package com.bank.mappers;

import com.bank.dto.out.PaymentOut;
import com.bank.models.Payment;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface PaymentMapper {
    PaymentOut entityToDto(Payment payment);
}
