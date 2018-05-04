package com.tangdou.succulent.host.config;

import com.tangdou.succulent.manager.api.article.ArticleCollectionServiceApi;
import com.tangdou.succulent.manager.api.article.ArticleCommentServiceApi;
import com.tangdou.succulent.manager.api.article.ArticleServiceApi;
import com.tangdou.succulent.manager.api.post.PostCollectionServiceApi;
import com.tangdou.succulent.manager.api.post.PostCommentServiceApi;
import com.tangdou.succulent.manager.api.post.PostServiceApi;
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

    /**
     * 文章收藏相关接口
     *
     * @return factory
     */
    @Bean("articleCollectionServiceApi")
    public HessianProxyFactoryBean articleCollectionServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/articleCollectionServiceApi");
        factory.setServiceInterface(ArticleCollectionServiceApi.class);
        return factory;
    }

    /**
     * 文章评论相关接口
     *
     * @return factory
     */
    @Bean("articleCommentServiceApi")
    public HessianProxyFactoryBean articleCommentServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/articleCommentServiceApi");
        factory.setServiceInterface(ArticleCommentServiceApi.class);
        return factory;
    }

    /**
     * 帖子收藏相关接口
     *
     * @return factory
     */
    @Bean("postCollectionServiceApi")
    public HessianProxyFactoryBean postCollectionServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/postCollectionServiceApi");
        factory.setServiceInterface(PostCollectionServiceApi.class);
        return factory;
    }

    /**
     * 帖子回帖相关接口
     *
     * @return factory
     */
    @Bean("postCommentServiceApi")
    public HessianProxyFactoryBean postCommentServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/postCommentServiceApi");
        factory.setServiceInterface(PostCommentServiceApi.class);
        return factory;
    }

    /**
     * 文章相关接口
     *
     * @return factory
     */
    @Bean("postServiceApi")
    public HessianProxyFactoryBean postServiceApi() {
        HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
        factory.setServiceUrl(MANAGER_HOST + "/hessian/postServiceApi");
        factory.setServiceInterface(PostServiceApi.class);
        return factory;
    }

}
