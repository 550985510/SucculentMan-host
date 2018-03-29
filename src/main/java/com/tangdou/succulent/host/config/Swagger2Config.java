package com.tangdou.succulent.host.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.Contact;
import springfox.documentation.service.SecurityScheme;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;

/**
 * api自动生产
 *
 * @seelink http://blog.csdn.net/catoop/article/details/50668896
 * @author 木叶丸
 */
@Configuration
@EnableSwagger2
@EnableAutoConfiguration
public class Swagger2Config {

    @Bean
    public Docket createRestApi() {
        ArrayList<SecurityScheme> auth = new ArrayList<SecurityScheme>(1);
        auth.add(new ApiKey("Authorization", "", "header"));

        return new Docket(DocumentationType.SWAGGER_2)
                .securitySchemes(auth)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.tangdou.succulent.host.api"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("多肉达人前端页面")
                .description("多肉达人前端页面接口模拟工具")
                .version("1.0")
                .build();
    }

}