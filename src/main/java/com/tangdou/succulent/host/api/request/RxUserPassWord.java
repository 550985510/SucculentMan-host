package com.tangdou.succulent.host.api.request;

import lombok.Data;

/**
 * @author 木叶丸
 * @date 2018/4/19
 */
@Data
public class RxUserPassWord {

    /**
     * 用户id
     */
    private Integer id;

    /**
     * 原密码
     */
    private String passWord;

    /**
     * 新密码
     */
    private String newPassWord;
}
