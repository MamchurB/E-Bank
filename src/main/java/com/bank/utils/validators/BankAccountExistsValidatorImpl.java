package com.bank.utils.validators;

import com.bank.repositories.BankAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class BankAccountExistsValidatorImpl implements ConstraintValidator<BankAccountExists, String> {

    private final BankAccountRepository bankAccountRepository;

    @Autowired
    public BankAccountExistsValidatorImpl(BankAccountRepository bankAccountRepository) {
        this.bankAccountRepository = bankAccountRepository;
    }


    @Override
    public void initialize(BankAccountExists constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return false;
        }
        value = value.replace(" ", "");
        return bankAccountRepository.existsByNumber(value);
    }
}
