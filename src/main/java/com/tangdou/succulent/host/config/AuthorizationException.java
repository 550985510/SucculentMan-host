package com.tangdou.succulent.host.config;

/**
 * 未登录异常返回
 * @author 木叶丸
 */
public class AuthorizationException extends IllegalArgumentException {

    public AuthorizationException(String message) {
        super(message);
    }

}
