package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.article.ArticleCommentServiceApi;
import com.tangdou.succulent.manager.api.article.model.ArticleComment;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author 木叶丸
 * Created by 木叶丸 on 2018/5/1 17:31
 */
@RestController
@RequestMapping("/api/articleComment")
@Api(description = "文章评论相关接口")
public class ArticleCommentApi {

    private User currentUser = new User();

    @Resource
    private ArticleCommentServiceApi articleCommentServiceApi;

    @PostMapping("/add")
    @ApiOperation("新增评论")
    public ResponseData add(@RequestBody ArticleComment articleComment, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        articleComment.setUserId(currentUser.getId());
        articleCommentServiceApi.add(articleComment);
        return result;
    }

    @PostMapping("/list")
    @ApiOperation("评论列表")
    public ResponseData list(@RequestBody ArticleComment articleComment) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = articleCommentServiceApi.findPage(articleComment);
        result.setData(responseResult.getData());
        return result;
    }
}
