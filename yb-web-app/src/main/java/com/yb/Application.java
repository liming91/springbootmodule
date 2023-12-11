package com.yb;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

/**
 * 启动器
 * Created by Ranger on 2023/12/06.
 */
@Slf4j
@EnableSwagger2WebMvc
@SpringBootApplication
public class Application {

    /* 解决druid 日志报错：discard long time none received connection:xxx */
    static {
        System.setProperty("druid.mysql.usePingMethod","false");
    }

    /**
     * 主启动函数
     */
    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(Application.class);
        springApplication.run(args);
        log.info(">>> {}", Application.class.getSimpleName().toUpperCase() + " STARTING SUCCESS");
    }
}
