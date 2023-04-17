package com.bank.exceptions.exceptions;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.CollectionUtils;

import java.util.Collection;

public class Check {
    public static void isNull(Object object, String message, Object... args){
        if(object == null){
            throw new ApiException(message, args);
        }
    }

    public static void isEmpty(Collection<?> collection, String message, Object... args){
        if(CollectionUtils.isEmpty(collection)){
            throw new ApiException(message, args);
        }
    }

    public static void isEmpty(String text, String message, Object... args){
        if(StringUtils.isBlank(text)){
            throw new ApiException(message, args);
        }
    }

}
