package com.tangdou.succulent.host.api.request;

import lombok.Data;

/**
 * 用户注册请求类
 * @author 木叶丸
 * @date 2018/4/12
 */
@Data
public class RxUser {

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 密码
     */
    private String passWord;

    /**
     * 昵称
     */
    private String nickName;
}
