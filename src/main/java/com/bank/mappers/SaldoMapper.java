package com.bank.mappers;

import com.bank.dto.out.SaldoOut;
import com.bank.models.Saldo;
import org.mapstruct.Mapper;

@Mapper (componentModel = "spring", uses=CurrencyTypeMapper.class)
public interface SaldoMapper
{
        SaldoOut saldoToSaldoOut( Saldo saldo);
}
