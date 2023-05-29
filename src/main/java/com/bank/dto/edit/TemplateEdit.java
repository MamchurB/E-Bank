package com.bank.dto.edit;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TemplateEdit {
    @NotNull
    private Long id;

    @NotBlank
    @Length(min = 26, max = 26)
    private String editSourceAccountNumber;
    private String editTransactionDirectionId;
    @NotBlank
    private String editSourceCurrency;

    @NotBlank
    @Length(min = 26, max = 26)
    private String editDestinedAccountNumber;

    @NotBlank
    private String editDestinedCurrency;

    @NotNull
    @Min(1)
    private BigDecimal editBalance;

    @NotBlank
    @Length(min = 1, max = 100)
    private String editTitle;
}
