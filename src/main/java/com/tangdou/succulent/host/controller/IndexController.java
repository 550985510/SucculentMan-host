package com.tangdou.succulent.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 * @author 木叶丸
 * @date 2017/12/12
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String root(){
        return "index";
    }

    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/header")
    public String home(){
        return "header";
    }

    @GetMapping("/error_404")
    public String notFoundError(){
        return "404";
    }

    @GetMapping("/error_500")
    public String serverError(){
        return "500";
    }

    @GetMapping("/error_403")
    public String forbiddenError(){
        return "403";
    }

}
