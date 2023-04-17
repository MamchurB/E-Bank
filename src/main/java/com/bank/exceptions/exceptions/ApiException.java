package com.bank.exceptions.exceptions;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ApiException extends RuntimeException {
    private String message;
    private Object[] args;
}
