package com.tangdou.succulent.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 木叶丸
 * Created by 木叶丸 on 2018/5/4 13:49
 */
@Controller
@RequestMapping("/post")
public class PostController {

    @GetMapping("/list")
    public String allPosts(){
        return "/post/list";
    }

    @GetMapping("/content")
    public String content(Integer postId){
        return "/post/content";
    }
}
