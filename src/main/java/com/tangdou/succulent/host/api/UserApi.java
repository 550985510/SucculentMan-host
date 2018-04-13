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
import io.swagger.annotations.ApiOperation;
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
@RestController
@RequestMapping("/api/user")
@Api(description = "用户相关接口")
public class UserApi {

    @Resource
    private UserServiceApi userServiceApi;

    /**
     * 用户注册
     * @param rxUser 注册信息
     * @param session session
     * @return 操作状态
     */
    @PostMapping("/register")
    @ApiOperation("用户注册")
    public ResponseData register(@RequestBody RxUser rxUser, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = userServiceApi.register(rxUser.getMobile(), rxUser.getPassWord());
        if (RestResultEnum.SUCCESS.getKey() != responseResult.getRetcode()) {
            result.setRetcode(responseResult.getRetcode());
            result.setMessage(responseResult.getMsg());
        }
        //注册成功后自动登陆
        User user = (User) userServiceApi.login(rxUser.getMobile(), rxUser.getPassWord()).getData();
        session.setAttribute(LoginInterceptor.SESSION_KEY, user);
        return result;
    }

    /**
     * 用户登陆
     * @param rxUser 注册信息
     * @param session session
     * @return 操作状态
     */
    @PostMapping("/login")
    @ApiOperation("用户登陆")
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

    @PostMapping("/logout")
    @ApiOperation("用户注销")
    public ResponseData logout(HttpSession session) {
        session.removeAttribute(LoginInterceptor.SESSION_KEY);
        return new ResponseData(ResponseCode.SUCCESS);
    }
}
