package com.bank.services.interfaces;

import com.bank.dto.edit.AddressEdit;
import com.bank.dto.out.AddressOut;

public interface AddressService
{
        AddressOut update (Long id, AddressEdit addressEdit);
}
