package com.bank.dto.out;

import com.bank.models.enums.BankAccountType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BankAccTypeOut {
    private Long id;

    private BankAccountType bankAccountType;

    private Float transactionComission;

    private Float exchangeCurrencyCommission;
}
