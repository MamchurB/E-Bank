package com.bank.mappers;

import com.bank.dto.in.InstallmentIn;
import com.bank.dto.out.InstallmentOut;
import com.bank.models.Installment;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
public interface InstallmentMapper {
    Installment dtoToEntity(InstallmentIn installmentIn);

    InstallmentOut entityToDto(Installment installment);
}
