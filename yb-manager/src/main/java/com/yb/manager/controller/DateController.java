package com.yb.manager.controller;

import com.yb.common.pojo.CommonResult;
import com.yb.manager.service.TestService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author liming
 * @Date 2023/12/11 14:54
 */
@Api(tags = "日期测试")
@RestController
@RequestMapping("/date")
@AllArgsConstructor
public class DateController {

    private final TestService testService;

    @ApiOperation("最近7天测试数据")
    @GetMapping("/getSevenDate")
    public CommonResult<?> getSevenDate(){
       return CommonResult.data(testService.getSevenDate());
    }
}
