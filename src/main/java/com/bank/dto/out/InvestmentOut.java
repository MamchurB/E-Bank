package com.bank.dto.out;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.Instant;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InvestmentOut {
    private Long id;

    private BigDecimal startBalance;

    private BigDecimal currentBalance;

    private String currency;

    private Instant creationDate;

    private InvestmentTypeOut investmentType;
}
