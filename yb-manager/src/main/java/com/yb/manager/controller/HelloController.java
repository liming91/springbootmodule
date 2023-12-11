package com.yb.manager.controller;

import com.yb.common.pojo.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author liming
 * @Date 2023/12/6 17:12
 */
@Api(tags = "测试接口")
@RestController
public class HelloController {

    @GetMapping({"/hello"})
    @ApiOperation("hello测试")
    public CommonResult<?> index() {
        return CommonResult.ok("WELCOME");
    }

}
