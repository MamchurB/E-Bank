package com.bank.config.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.Date;
import java.util.List;

public class JwtTokenGenerator {

    private JwtTokenGenerator() {
    }

    @SuppressWarnings("deprecation")
    public static String generate(String username, String identifier, List<String> roles) {
        byte[] apiKeySecretBytes = SecurityConstants.JWT_SECRET.getBytes();
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, SignatureAlgorithm.HS512.getJcaName());

        return Jwts.builder()
            .claim("rol", roles)
            .claim("id",identifier )
            .setSubject(username)
            .setExpiration(new Date(System.currentTimeMillis() + SecurityConstants.TTL_TOKEN))
            .signWith(SignatureAlgorithm.HS512, signingKey)
            .compact();
    }

}
