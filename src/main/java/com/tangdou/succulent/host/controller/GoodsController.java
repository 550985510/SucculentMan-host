package com.tangdou.succulent.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 木叶丸
 * Created by 木叶丸 on 2018/5/6 16:23
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @GetMapping("/home")
    public String home() {
        return "/goods/home";
    }

    @GetMapping("/list")
    public String allGoods(){
        return "/goods/list";
    }

    @GetMapping("/content")
    public String content(Integer goodsId){
        return "/goods/content";
    }
}
