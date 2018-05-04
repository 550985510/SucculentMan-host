package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.post.PostServiceApi;
import com.tangdou.succulent.manager.api.post.model.Post;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 帖子相关接口
 * @author 木叶丸
 * @date 2018/3/29
 */
@RestController
@RequestMapping("/api/post")
@Api(description = "帖子相关接口")
public class PostApi {

    private User currentUser = new User();

    @Resource
    private PostServiceApi postServiceApi;

    @PostMapping("/list")
    @ApiOperation("帖子列表")
    public ResponseData list(@RequestBody Post post) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = postServiceApi.list(post);
        result.setData(responseResult.getData());
        return result;
    }

    @PostMapping("/detail")
    @ApiOperation("帖子详情")
    public ResponseData detail(@RequestParam("postId") Integer postId) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        Post post = postServiceApi.detail(postId, 0).getData();
        result.setData(post);
        return result;
    }

    @PostMapping("/add")
    @ApiOperation("发表新帖")
    public ResponseData add(@RequestBody Post post, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        post.setUserId(currentUser.getId());
        postServiceApi.add(post);
        return result;
    }
}
