package com.bank.mappers;

import com.bank.dto.in.AddressIn;
import com.bank.dto.out.AddressOut;
import com.bank.models.user.Address;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
public interface AddressMapper {
    Address DTOtoEntity(AddressIn addressIn);

    AddressOut entityToDTO(Address address);
}
