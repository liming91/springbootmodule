package com.yb.manager.controller;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.yb.common.pojo.CommonResult;

import com.yb.manager.entity.NewShare;
import com.yb.manager.entity.dto.ShareDTO;
import com.yb.manager.service.NewShareService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @Author liming
 * @Date 2024/1/12 15:46
 */
@Api(tags = "共享")
@RestController
@RequestMapping("/share")
@RequiredArgsConstructor
public class ShareController {

    private final NewShareService newShareService;

    @GetMapping("/list")
    @ApiOperation("列表")
    public CommonResult<List<NewShare>> list(Long id, String fileName, String startTime, String endTime) {
        List<NewShare> list = newShareService.shareList(id, fileName, startTime, endTime);
        return CommonResult.data(list);
    }


    @GetMapping("/detail")
    @ApiOperation("文件共享详情")
    public CommonResult<NewShare> detail(Long id) {
        NewShare newShare = newShareService.detail(id);
        return CommonResult.data(newShare);
    }

    @ApiOperation("新增分享")
    @PostMapping("/addShare")
    public CommonResult<ShareDTO> addShare(@RequestBody ShareDTO shareDTO) {
        int rows = newShareService.addShare(shareDTO);
        if (rows > 0) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }


    @ApiOperation("修改分享")
    @PostMapping("/updateShare")
    public CommonResult<Void> updateShare(@RequestBody NewShare newShare) {
        newShare.setModifyBy(111L);
        newShare.setModifyTime(new Date());
        boolean flag = newShareService.updateById(newShare);
        if (flag) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }

    @ApiOperation("删除")
    @PostMapping("/delete")
    public CommonResult<?> delete(Long id) {
        boolean flag = newShareService.update(new LambdaUpdateWrapper<NewShare>().set(NewShare::getDeleted, 1)
                .eq(NewShare::getId, id));
        if (flag) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }

}
