package com.tangdou.succulent.host.api.request;

import lombok.Data;

/**
 * 修改用户基本信息
 * @author 木叶丸
 * @date 2018/4/18
 */
@Data
public class RxUserBaseInfo {

    /**
     * 用户id
     */
    private Integer id;

    /**
     * 用户姓名
     */
    private String name;

    /**
     * 用户性别
     */
    private Integer gender;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 用户邮箱
     */
    private String email;
}
