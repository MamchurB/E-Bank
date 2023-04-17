package com.bank.dto.in;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InvestmentIn {

    private Long destinedSaldoId;

    @NotNull
    @Min(0)
    private BigDecimal startBalance;
}
