package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.goods.GoodsCommentServiceApi;
import com.tangdou.succulent.manager.api.goods.model.GoodsComment;
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
@RequestMapping("/api/goodsComment")
@Api(description = "商品评论相关接口")
public class GoodsCommentApi {

    private User currentUser = new User();

    @Resource
    private GoodsCommentServiceApi goodsCommentServiceApi;

    @PostMapping("/add")
    @ApiOperation("新增评论")
    public ResponseData add(@RequestBody GoodsComment goodsComment, HttpSession session) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        goodsComment.setUserId(currentUser.getId());
        goodsCommentServiceApi.add(goodsComment);
        return result;
    }

    @PostMapping("/list")
    @ApiOperation("评论列表")
    public ResponseData list(@RequestBody GoodsComment goodsComment) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = goodsCommentServiceApi.findPage(goodsComment);
        result.setData(responseResult.getData());
        return result;
    }
}
