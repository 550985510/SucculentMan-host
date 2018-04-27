package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.article.ArticleCollectionServiceApi;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.user.model.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 文章收藏相关接口
 * @author 木叶丸
 * Created by 木叶丸 on 2018/4/25 16:57
 */
@RestController
@RequestMapping("/api/articleCollect")
@Api(description = "文章收藏相关接口")
public class ArticleCollectionApi {

    private User currentUser = new User();

    @Resource
    private ArticleCollectionServiceApi articleCollectionServiceApi;

    @PostMapping("/isCollected")
    @ApiOperation("是否收藏判断")
    public ResponseData isCollected(@RequestParam("articleId") Integer articleId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        if (currentUser != null) {
            ResponseResult responseResult = articleCollectionServiceApi.isCollected(currentUser.getId(), articleId);
            result.setData(responseResult.getData());
        }
        return result;
    }

    @PostMapping("/collection")
    @ApiOperation("添加收藏")
    public ResponseData collection(@RequestParam("articleId") Integer articleId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        articleCollectionServiceApi.collection(currentUser.getId(), articleId);
        return result;
    }

    @PostMapping("/unCollection")
    @ApiOperation("取消收藏")
    public ResponseData unCollection(@RequestParam("articleId") Integer articleId, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        articleCollectionServiceApi.unCollection(currentUser.getId(), articleId);
        return result;
    }

    @PostMapping("/collectedNum")
    @ApiOperation("文章收藏数量")
    public ResponseData collectedNum(@RequestParam("articleId") Integer articleId) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = articleCollectionServiceApi.findCollectedNum(articleId);
        result.setData(responseResult.getData());
        return result;
    }
}
