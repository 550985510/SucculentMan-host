package com.tangdou.succulent.host.config;

import com.tangdou.succulent.host.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/**
 * Web 配置
 * @author 木叶丸
 */
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

    @Value("${img.location}")
    private String location;

    @Resource
    private LoginInterceptor loginInterceptor;

    /**
     * 静态资源映射
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");


        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/")
                .addResourceLocations("file:" + location)
                .setCacheControl(CacheControl.maxAge(10, TimeUnit.MINUTES));
        super.addResourceHandlers(registry);
    }

    /**
     * 配置登录状态
     * 只拦截需要保护的资源
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //未登录状态需要被拦截的请求地址
        registry.addInterceptor(loginInterceptor)
                //用户关注
                .addPathPatterns("/api/follow/follow")
                //取消关注
                .addPathPatterns("/api/follow/unFollow")
                //文章收藏
                .addPathPatterns("/api/articleCollect/collection")
                //文章取消收藏
                .addPathPatterns("/api/articleCollect/unCollection")
                //新增文章评论
                .addPathPatterns("/api/articleComment/add")
                //商品收藏
                .addPathPatterns("/api/goodsCollect/collection")
                //商品取消收藏
                .addPathPatterns("/api/goodsCollect/unCollection")
                //新增商品评论
                .addPathPatterns("/api/goodsComment/add")
                //帖子收藏
                .addPathPatterns("/api/postCollect/collection")
                //帖子取消收藏
                .addPathPatterns("/api/postCollect/unCollection")
                //新增帖子回帖
                .addPathPatterns("/api/postComment/add")
                //发表新帖
                .addPathPatterns("/api/post/add")
                //订单相关接口
                .addPathPatterns("/api/order/**")
                //文件上传
                .addPathPatterns("/api/upload/**")
                //修改个人资料页面接口
                .addPathPatterns("/user/accountEdit")
                //修改个人资料数据接口
                .addPathPatterns("/api/user/edit/**");
    }

    /**
     * 错误页面处理
     *
     * @return 错误信息
     */
    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return container -> {
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error_404"));
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error_500"));
            container.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/error_403"));
        };
    }

    @Bean
    public FilterRegistrationBean corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOrigin("*");
        config.addAllowedHeader("*");
        config.addAllowedMethod("GET");
        config.addAllowedMethod("POST");
        source.registerCorsConfiguration("/**", config);
        final FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
        bean.setOrder(0);
        return bean;
    }

    /**
     * 设置默认语言规则
     */
    @Bean
    public LocaleResolver localeResolver() {
        SessionLocaleResolver slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.CHINA);
        return slr;
    }

}
