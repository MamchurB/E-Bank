package com.bank.models.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.hibernate.annotations.Immutable;


@Getter
@Immutable
@AllArgsConstructor
public class JwtToken {
    private String token;

    private JwtToken(){}
}
