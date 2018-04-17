package com.tangdou.succulent.host.api.request;

import lombok.Data;

/**
 * @author 木叶丸
 * @date 2018/4/17
 */
@Data
public class RxUserFollow {

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 被关注用户id
     */
    private Integer followedId;
}
