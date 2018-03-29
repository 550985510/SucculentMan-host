package com.tangdou.succulent.host.config;

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
     * 用户相关任务接口
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

}
