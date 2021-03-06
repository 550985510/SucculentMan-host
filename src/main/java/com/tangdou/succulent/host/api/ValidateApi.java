package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * 校验接口
 * @author 木叶丸
 * @date 2018/4/13
 */
@RestController
@RequestMapping("/api/check")
@Api(description = "校验相关接口")
public class ValidateApi {

    @PostMapping("/mobile")
    @ApiOperation("手机号校验")
    public ResponseData checkMobile(@RequestParam("mobile") String mobile) {
        String regMobile = "^[1][3,4,5,7,8][0-9]{9}$";
        if(!mobile.matches(regMobile)){
            return new ResponseData(ResponseCode.ERROR_MOBILE_FORMAT);
        }else{
            return new ResponseData(ResponseCode.SUCCESS);
        }
    }

    @PostMapping("/email")
    @ApiOperation("邮箱校验")
    public ResponseData checkEmail(@RequestParam("email") String email) {
        String regEmail = "^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        if(!email.matches(regEmail)){
            return new ResponseData(ResponseCode.ERROR_EMAIL_FORMAT);
        }else{
            return new ResponseData(ResponseCode.SUCCESS);
        }
    }

    @PostMapping("/nickName")
    @ApiOperation("昵称校验")
    public ResponseData checkNickName(@RequestParam("nickName") String nickName) {
        if(nickName.length() < 2 || nickName.length() > 32) {
            return new ResponseData(ResponseCode.ERROR_NICKNAME_FORMAT);
        }else{
            return new ResponseData(ResponseCode.SUCCESS);
        }
    }

    @PostMapping("/name")
    @ApiOperation("姓名校验")
    public ResponseData checkName(@RequestParam("name") String name) {
        String regName = "^([\\u4e00-\\u9fa5]{2,10}|[a-zA-Z\\.\\s]{1,20})$";
        if(!name.matches(regName)) {
            return new ResponseData(ResponseCode.ERROR_NAME_FORMAT);
        }else{
            return new ResponseData(ResponseCode.SUCCESS);
        }
    }
}
