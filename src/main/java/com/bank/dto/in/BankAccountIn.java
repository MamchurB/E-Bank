package com.bank.dto.in;

import com.bank.models.enums.BankAccountType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BankAccountIn {
    @NotNull
    private BankAccountType bankAccountType;
}
