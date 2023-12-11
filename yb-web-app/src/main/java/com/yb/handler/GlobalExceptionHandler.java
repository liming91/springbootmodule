package com.yb.handler;

import com.yb.common.pojo.CommonResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局异常处理器
 * Created by Ranger on 2023/12/08.
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 不同异常返回不同结果
     *
     * @author xuyuxiang
     * @date 2022/7/28 16:54
     **/
    @ResponseBody
    @ExceptionHandler
    public CommonResult<String> handleException(Exception e) {
        return GlobalExceptionUtil.getCommonResult(e);
    }
}
