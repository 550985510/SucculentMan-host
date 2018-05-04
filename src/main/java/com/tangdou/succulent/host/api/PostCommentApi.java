package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.post.PostCommentServiceApi;
import com.tangdou.succulent.manager.api.post.model.PostComment;
import com.tangdou.succulent.manager.api.common.ResponseResult;
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
 * @author 木叶丸
 * Created by 木叶丸 on 2018/5/1 17:31
 */
@RestController
@RequestMapping("/api/postComment")
@Api(description = "帖子回帖相关接口")
public class PostCommentApi {

    private User currentUser = new User();

    @Resource
    private PostCommentServiceApi postCommentServiceApi;

    @PostMapping("/add")
    @ApiOperation("新增回帖")
    public ResponseData add(@RequestBody PostComment postComment, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        postComment.setUserId(currentUser.getId());
        postCommentServiceApi.add(postComment);
        return result;
    }

    @PostMapping("/list")
    @ApiOperation("回帖列表")
    public ResponseData list(@RequestBody PostComment postComment) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = postCommentServiceApi.findPage(postComment);
        result.setData(responseResult.getData());
        return result;
    }
}
