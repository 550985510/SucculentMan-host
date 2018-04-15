package com.tangdou.succulent.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户页面路由
 * @author 木叶丸
 * @date 2018/4/15
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @GetMapping("/personalCenter/{userId}")
    public String personalCenter(@PathVariable Integer userId){
        return "/user/personalCenter";
    }

    @GetMapping("/accountEdit")
    public String accountEdit(){
        return "/user/accountEdit";
    }
}
