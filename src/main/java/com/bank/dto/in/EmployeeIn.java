package com.bank.dto.in;

import com.bank.utils.validators.EmailTaken;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EmployeeIn {

    @Length(min = 8, max = 100)
    @NotNull
    private String password;

    @Transient
    private String passwordConfirm;

    private String confirmPassword;

    @EmailTaken
    private String emailEmployee;

    @Valid
    private AddressIn addressEmployee;
}
