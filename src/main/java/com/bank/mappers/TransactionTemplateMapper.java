package com.bank.mappers;

import com.bank.dto.in.TransactionTemplateIn;
import com.bank.dto.out.TransactionTemplateOut;
import com.bank.models.TransactionTemplate;
import org.mapstruct.Mapper;

@Mapper (componentModel = "spring")
public interface TransactionTemplateMapper
{
        TransactionTemplateOut entityToDTO ( TransactionTemplate transactionTemplate );

        TransactionTemplate DTOtoEntity ( TransactionTemplateIn transactionTemplateIn);
}
