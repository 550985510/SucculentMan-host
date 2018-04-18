package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.api.request.RxUserBaseInfo;
import com.tangdou.succulent.host.api.request.RxUserRegister;
import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.common.RestResultEnum;
import com.tangdou.succulent.manager.api.user.UserServiceApi;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

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

    private User currentUser = new User();

    @Resource
    private UserServiceApi userServiceApi;

    /**
     * 用户注册
     * @param rxUserRegister 注册信息
     * @param session session
     * @return 操作状态
     */
    @PostMapping("/register")
    @ApiOperation("用户注册")
    public ResponseData register(@RequestBody RxUserRegister rxUserRegister, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = userServiceApi.register(rxUserRegister.getMobile(), rxUserRegister.getPassWord(), rxUserRegister.getNickName());
        if (RestResultEnum.SUCCESS.getKey() != responseResult.getRetcode()) {
            result.setRetcode(responseResult.getRetcode());
            result.setMessage(responseResult.getMsg());
        } else {
            //注册成功后自动登陆
            User user = (User) userServiceApi.login(rxUserRegister.getMobile(), rxUserRegister.getPassWord()).getData();
            session.setAttribute(LoginInterceptor.SESSION_KEY, user);
        }
        return result;
    }

    /**
     * 用户登陆
     * @param rxUserRegister 注册信息
     * @param session session
     * @return 操作状态
     */
    @PostMapping("/login")
    @ApiOperation("用户登陆")
    public ResponseData login(@RequestBody RxUserRegister rxUserRegister, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = userServiceApi.login(rxUserRegister.getMobile(), rxUserRegister.getPassWord());
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

    @GetMapping("/findById")
    @ApiOperation("通过id查询用户信息")
    public ResponseData findById(Integer id) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = userServiceApi.findById(id);
        result.setData(responseResult.getData());
        return result;
    }

    @PostMapping("/edit/baseInfo")
    @ApiOperation("修改基本信息")
    public ResponseData editBaseInfo(@RequestBody RxUserBaseInfo info, HttpSession session) {
        ResponseData result = new ResponseData();
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        if (!currentUser.getId().equals(info.getId())) {
            return new ResponseData(ResponseCode.ERROR_USER_NOT_EXIST);
        }
        User user = new User();
        if (info.getName() != null) {
            user.setName(info.getName());
        }
        if (info.getEmail() != null) {
            user.setEmail(info.getEmail());
        }
        user.setId(info.getId());
        user.setGender(info.getGender());
        user.setAvatar(info.getAvatar());
        ResponseResult responseResult = userServiceApi.edit(user);
        result.setRetcode(responseResult.getRetcode());
        result.setMessage(responseResult.getMsg());
        return result;
    }
}
