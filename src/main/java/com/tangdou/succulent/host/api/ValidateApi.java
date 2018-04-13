package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import org.springframework.web.bind.annotation.*;

/**
 * 校验接口
 * @author 木叶丸
 * @date 2018/4/13
 */
@RestController
@RequestMapping("/api/check")
public class ValidateApi {

    @PostMapping("/mobile")
    public ResponseData checkMobile(@RequestParam("mobile") String mobile) {
        String regMobile = "^[1][3,4,5,7,8][0-9]{9}$";
        if(!mobile.matches(regMobile)){
            return new ResponseData(ResponseCode.ERROR_MOBILE_FORMAT);
        }else{
            return new ResponseData(ResponseCode.SUCCESS);
        }
    }

    @PostMapping("/email")
    public ResponseData checkEmail(@RequestParam("email") String email) {
        String regEmail = "^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        if(!email.matches(regEmail)){
            return new ResponseData(ResponseCode.ERROR_EMAIL_FORMAT);
        }else{
            return new ResponseData(ResponseCode.SUCCESS);
        }
    }
}
