package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import com.tangdou.succulent.manager.api.order.OrderServiceApi;
import com.tangdou.succulent.manager.api.order.model.Order;
import com.tangdou.succulent.manager.api.post.model.Post;
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
 * Created by 木叶丸 on 2018/5/8 13:54
 */
@RestController
@RequestMapping("/api/order")
@Api(description = "订单相关接口")
public class OrderApi {

    private User currentUser = new User();

    @Resource
    private OrderServiceApi orderServiceApi;

    @PostMapping("/list")
    @ApiOperation("订单列表")
    public ResponseData list(@RequestBody Order order) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        ResponseResult responseResult = orderServiceApi.list(order);
        result.setData(responseResult.getData());
        return result;
    }

    @PostMapping("/add")
    @ApiOperation("新增订单")
    public ResponseData add(@RequestBody Order order, HttpSession session) {
        currentUser = (User) session.getAttribute(LoginInterceptor.SESSION_KEY);
        order.setUserId(currentUser.getId());
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        orderServiceApi.add(order);
        return result;
    }

    @PostMapping("/edit")
    @ApiOperation("修改订单状态")
    public ResponseData edit(@RequestBody Order order) {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        orderServiceApi.edit(order);
        return result;
    }
}
