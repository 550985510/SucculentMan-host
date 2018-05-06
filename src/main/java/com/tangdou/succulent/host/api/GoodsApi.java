package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.manager.api.goods.GoodsServiceApi;
import com.tangdou.succulent.manager.api.goods.model.Goods;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 商品相关接口
 * @author 木叶丸
 * @date 2018/3/29
 */
@RestController
@RequestMapping("/api/goods")
@Api(description = "商品相关接口")
public class GoodsApi {

    @Resource
    private GoodsServiceApi goodsServiceApi;

    @PostMapping("/list")
    @ApiOperation("商品列表")
    public ResponseData list(@RequestBody Goods goods) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = goodsServiceApi.list(goods);
        result.setData(responseResult.getData());
        return result;
    }

    @PostMapping("/detail")
    @ApiOperation("商品详情")
    public ResponseData detail(@RequestParam("goodsId") Integer goodsId) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        Goods goods = goodsServiceApi.detail(goodsId, 1).getData();
        result.setData(goods);
        return result;
    }

    @PostMapping("/show")
    @ApiOperation("首页商品展示")
    public ResponseData show() {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = goodsServiceApi.showGoods();
        result.setData(responseResult.getData());
        return result;
    }
}
