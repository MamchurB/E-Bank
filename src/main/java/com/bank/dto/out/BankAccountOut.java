package com.bank.dto.out;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BankAccountOut {
    private Long id;

    private String number;

    private BankAccTypeOut bankAccType;

    private Set<SaldoOut> saldos;

    private boolean removed;
}
