package com.bank.utils.validators;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PostCodeValidatorImpl implements ConstraintValidator<PostCode, String> {
    @Override
    public void initialize(PostCode constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return false;
        }

        return value.matches("[\\d]{2}-[\\d]{3}");
    }
}
