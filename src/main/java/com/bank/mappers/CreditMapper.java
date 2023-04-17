package com.bank.mappers;

import com.bank.dto.in.CreditIn;
import com.bank.dto.out.CreditOut;
import com.bank.models.Credit;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring", uses = CreditStatusMapper.class)
public interface CreditMapper {
    Credit DTOtoEntity(CreditIn creditIn);

    @Mapping(source = "credit.destinedSaldo.id", target = "destinedSaldoId")
    CreditOut entityToDTO(Credit credit);
}
