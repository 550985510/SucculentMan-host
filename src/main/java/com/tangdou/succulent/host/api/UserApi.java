package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.api.request.RxUser;
import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.common.RestResultEnum;
import com.tangdou.succulent.manager.api.user.UserServiceApi;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 用户相关接口
 * @author 木叶丸
 * @date 2018/4/3
 */
@Api("用户相关接口")
@RestController
@RequestMapping("/api/user")
public class UserApi {

    @Resource
    private UserServiceApi userServiceApi;

    @PostMapping("/register")
    public ResponseData register(@RequestBody RxUser rxUser) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = userServiceApi.register(rxUser.getMobile(), rxUser.getPassWord());
        if (RestResultEnum.SUCCESS.getKey() != responseResult.getRetcode()) {
            result.setRetcode(responseResult.getRetcode());
            result.setMessage(responseResult.getMsg());
        }
        return result;
    }

    @PostMapping("/login")
    public ResponseData login(@RequestBody RxUser rxUser, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = userServiceApi.login(rxUser.getMobile(), rxUser.getPassWord());
        if (RestResultEnum.SUCCESS.getKey() != responseResult.getRetcode()) {
            result.setRetcode(responseResult.getRetcode());
            result.setMessage(responseResult.getMsg());
        }
        User user = (User) responseResult.getData();
        session.setAttribute(LoginInterceptor.SESSION_KEY, user);
        return result;
    }
}
