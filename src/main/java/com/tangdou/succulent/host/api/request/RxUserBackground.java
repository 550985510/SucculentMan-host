package com.tangdou.succulent.host.api.request;

import lombok.Data;

/**
 * 修改用户封面图
 * @author 木叶丸
 * @date 2018/4/20
 */
@Data
public class RxUserBackground {

    /**
     * 用户id
     */
    private Integer id;

    /**
     * 用户封面图
     */
    private String background;
}
