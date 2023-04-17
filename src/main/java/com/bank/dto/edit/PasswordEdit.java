package com.bank.dto.edit;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.AssertTrue;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PasswordEdit {
    private String password;
    private String confirmPassword;

    @AssertTrue
    public boolean isPasswordsEqual() {
        return password.equals(confirmPassword);
    }
}
