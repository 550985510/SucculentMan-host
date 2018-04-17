package com.tangdou.succulent.host.config;

import com.tangdou.succulent.manager.api.article.ArticleServiceApi;
import com.tangdou.succulent.manager.api.user.UserFollowServiceApi;
import com.tangdou.succulent.manager.api.user.UserServiceApi;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.remoting.caucho.HessianProxyFactoryBean;

/**
 * 配置hession Service
 * @author 木叶丸
 */
@Configuration
public class HessianConfig {

    /**
     * 铁军部署hessian的服务
     */
    @Value("${app.manager.host}")
    private String MANAGER_HOST;

    /**
     * 用户相关接口
     *
     * @return factory
     */
    @Bean("userServiceApi")
    public HessianProxyFactoryBean userServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/userServiceApi");
        factory.setServiceInterface(UserServiceApi.class);
        return factory;
    }

    /**
     * 文章相关接口
     *
     * @return factory
     */
    @Bean("articleServiceApi")
    public HessianProxyFactoryBean articleServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/articleServiceApi");
        factory.setServiceInterface(ArticleServiceApi.class);
        return factory;
    }

    /**
     * 用户关注相关接口
     *
     * @return factory
     */
    @Bean("userFollowServiceApi")
    public HessianProxyFactoryBean userFollowServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/userFollowServiceApi");
        factory.setServiceInterface(UserFollowServiceApi.class);
        return factory;
    }

}
