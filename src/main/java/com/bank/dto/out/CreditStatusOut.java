package com.bank.dto.out;

import com.bank.models.enums.CreditStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreditStatusOut
{
        private Long id;

        private CreditStatus.CreditType creditType;
}
