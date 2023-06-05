package com.bank.dto.edit;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CurrencyTypeEdit {
    private Long idCurrency;
    private String name;
    private float exchangeRate;
}
