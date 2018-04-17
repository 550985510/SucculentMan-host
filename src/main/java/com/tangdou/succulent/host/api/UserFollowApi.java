package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.user.UserFollowServiceApi;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 用户关注相关接口
 * @author 木叶丸
 * @date 2018/4/17
 */
@RestController
@RequestMapping("/api/follow")
@Api(description = "用户关注相关接口")
public class UserFollowApi {

    private User currentUser = new User();

    @Resource
    private UserFollowServiceApi userFollowServiceApi;

    @GetMapping("/isFollowed")
    @ApiOperation("是否关注判断")
    public ResponseData isFollowed(@RequestParam("followedId") Integer followedId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        if (currentUser != null) {
            ResponseResult responseResult = userFollowServiceApi.isFollowed(currentUser.getId(), followedId);
            result.setData(responseResult.getData());
        }
        return result;
    }

    @GetMapping("/follow")
    @ApiOperation("添加关注")
    public ResponseData follow(@RequestParam("followedId") Integer followedId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        userFollowServiceApi.follow(currentUser.getId(), followedId);
        return result;
    }

    @GetMapping("/unFollow")
    @ApiOperation("取消关注")
    public ResponseData unFollow(@RequestParam("followedId") Integer followedId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        userFollowServiceApi.unFollow(currentUser.getId(), followedId);
        return result;
    }
}
