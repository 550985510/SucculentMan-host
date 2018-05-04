package com.tangdou.succulent.host.api;

import com.github.pagehelper.PageInfo;
import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.manager.api.article.ArticleServiceApi;
import com.tangdou.succulent.manager.api.article.model.Article;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 文章相关接口
 * @author 木叶丸
 * @date 2018/3/29
 */
@RestController
@RequestMapping("/api/article")
@Api(description = "文章相关接口")
public class ArticleApi {

    @Resource
    private ArticleServiceApi articleServiceApi;

    @PostMapping("/list")
    @ApiOperation("文章列表")
    public ResponseData list(@RequestBody Article article) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = articleServiceApi.list(article);
        result.setData(responseResult.getData());
        return result;
    }

    @PostMapping("/detail")
    @ApiOperation("文章详情")
    public ResponseData detail(@RequestParam("articleId") Integer articleId) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        Article article = articleServiceApi.detail(articleId, 2).getData();
        result.setData(article);
        return result;
    }
}
