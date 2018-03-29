package com.tangdou.succulent.host.api;

import com.github.pagehelper.PageInfo;
import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.manager.api.article.Article;
import com.tangdou.succulent.manager.api.article.ArticleServiceApi;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 文章相关接口
 * @author 木叶丸
 * @date 2018/3/29
 */
@Api("文章相关接口")
@RestController
@RequestMapping("/api/article")
public class ArticleApi {

    @Resource
    private ArticleServiceApi articleServiceApi;

    @PostMapping("/list")
    public ResponseData list(@RequestBody Article article) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        PageInfo<Article> pageInfo = articleServiceApi.list(article);
        result.setData(pageInfo);
        return result;
    }
}
