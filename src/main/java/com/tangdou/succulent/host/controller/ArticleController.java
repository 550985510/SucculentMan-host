package com.tangdou.succulent.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 文章页面路由
 * @author 木叶丸
 * Created by 木叶丸 on 2018/4/25 13:53
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @GetMapping("/list")
    public String allArticles(){
        return "/article/list";
    }
}
