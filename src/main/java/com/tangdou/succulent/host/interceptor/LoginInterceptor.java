package com.tangdou.succulent.host.interceptor;

import com.tangdou.succulent.host.config.AuthorizationException;
import com.tangdou.succulent.manager.api.user.model.User;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.http.HttpStatus;
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
        User currentUser = (User) session.getAttribute(SESSION_KEY);
        if (currentUser != null) {
            return true;
        } else {
            String requestUri = request.getRequestURI();
            String contextPath = request.getContextPath();
            String url = requestUri.substring(contextPath.length());
            String regApi = ".*api.*";
            if (url.matches(regApi)) {
                throw new AuthorizationException("未登录，禁止访问");
            } else {
                response.sendRedirect("/error_403");
                return false;
            }
        }
    }

}
