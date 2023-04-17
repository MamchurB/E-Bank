package com.bank.mappers;

import com.bank.dto.out.BankAccTypeOut;
import com.bank.models.BankAccType;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper (componentModel = "spring")
public interface BankAccTypeMapper
{
        BankAccTypeOut entityToDto ( BankAccType bankAccType );
}
