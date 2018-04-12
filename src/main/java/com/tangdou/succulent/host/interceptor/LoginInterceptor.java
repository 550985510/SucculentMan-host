package com.tangdou.succulent.host.interceptor;

import com.tangdou.succulent.manager.api.user.model.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 拦截用户未从微信登录访问页面获取数据
 *
 * @author wangkun23 2017/6/20.
 */
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

    public final static String SESSION_KEY = "user";


    /**
     * 拦截器
     * @param request 请求
     * @param response 响应
     * @param handler 处理
     * @return 登陆状态
     * @throws Exception 异常
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session =request.getSession();
        boolean isLogin = false;
        User currentUser = (User) session.getAttribute(SESSION_KEY);
        if (currentUser != null) {
            isLogin = true;
        }
        return isLogin;
    }

}
