package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.post.PostCollectionServiceApi;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 帖子收藏相关接口
 * @author 木叶丸
 * Created by 木叶丸 on 2018/4/25 16:57
 */
@RestController
@RequestMapping("/api/postCollect")
@Api(description = "帖子收藏相关接口")
public class PostCollectionApi {

    private User currentUser = new User();

    @Resource
    private PostCollectionServiceApi postCollectionServiceApi;

    @PostMapping("/isCollected")
    @ApiOperation("是否收藏判断")
    public ResponseData isCollected(@RequestParam("postId") Integer postId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        if (currentUser != null) {
            ResponseResult responseResult = postCollectionServiceApi.isCollected(currentUser.getId(), postId);
            result.setData(responseResult.getData());
        }
        return result;
    }

    @PostMapping("/collection")
    @ApiOperation("添加收藏")
    public ResponseData collection(@RequestParam("postId") Integer postId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        postCollectionServiceApi.collection(currentUser.getId(), postId);
        return result;
    }

    @PostMapping("/unCollection")
    @ApiOperation("取消收藏")
    public ResponseData unCollection(@RequestParam("postId") Integer postId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        postCollectionServiceApi.unCollection(currentUser.getId(), postId);
        return result;
    }

    @PostMapping("/collectedNum")
    @ApiOperation("帖子收藏数量")
    public ResponseData collectedNum(@RequestParam("postId") Integer postId) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = postCollectionServiceApi.findCollectedNum(postId);
        result.setData(responseResult.getData());
        return result;
    }
}
