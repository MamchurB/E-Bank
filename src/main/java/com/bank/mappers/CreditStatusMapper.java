package com.bank.mappers;

import com.bank.dto.out.CreditStatusOut;
import com.bank.models.enums.CreditStatus;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper (componentModel = "spring")
public interface CreditStatusMapper
{
        CreditStatusOut entityToDTO ( CreditStatus creditStatus );
}
