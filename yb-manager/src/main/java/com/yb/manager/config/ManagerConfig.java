package com.yb.manager.config;

import com.yb.common.pojo.CommonResult;
import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * @Author liming
 * @Date 2023/12/6 20:01
 */
@Configuration
public class ManagerConfig {

    /**
     * API文档分组配置
     **/
    @Bean(value = "managerDocApi")
    public Docket managerDocApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(new ApiInfoBuilder()
                        .title("综合管理一张图")
                        .description("综合管理一张图")
                        .termsOfServiceUrl("https://www.yb.com")
                        .contact(new Contact("YB_HUB_TEAM", "www.yb.com", "wilton.icp@gmail.com"))
                        .version("2.0.0")
                        .build())
                .globalResponseMessage(RequestMethod.GET, CommonResult.responseList())
                .globalResponseMessage(RequestMethod.POST, CommonResult.responseList())
                .groupName("综合管理一张图")
                .select()
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .apis(RequestHandlerSelectors.basePackage("com.yb.manager"))
                .paths(PathSelectors.any())
                .build();
    }

}
