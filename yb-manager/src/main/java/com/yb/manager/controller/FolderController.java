package com.yb.manager.controller;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.yb.common.pojo.CommonResult;

import com.yb.manager.entity.NewFolder;
import com.yb.manager.entity.vo.NewFolderVO;
import com.yb.manager.service.NewFolderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @Author liming
 * @Date 2024/1/9 14:55
 */
@Api(tags = "文件夹")
@RestController
@RequestMapping("/folder")
@RequiredArgsConstructor
public class FolderController {

    private final NewFolderService newFolderService;

    @ApiOperation("根据文件id查询所有子节点")
    @GetMapping("/getChildNode")
    public CommonResult<List<NewFolderVO>> getChildNode(Long id) {
        List<NewFolderVO> list = newFolderService.getChildNode(id);
        return CommonResult.data(list);
    }

    @ApiOperation("根据文件id查询所有父节点")
    @GetMapping("/listByParentId")
    public CommonResult<List<NewFolder>> listByParentId(Long id) {
        List<NewFolder> folderList = newFolderService.findParentById(id);
        return CommonResult.data(folderList);
    }


    @ApiOperation("新建文件夹")
    @PostMapping("/add")
    public CommonResult<NewFolder> add(@RequestBody NewFolder newFolder) {
        newFolder.setType(0L);
        boolean save = newFolderService.saveFolder(newFolder);
        if (save) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }



    @ApiOperation("修改文件夹名称")
    @PostMapping("/update")
    public CommonResult<NewFolder> update(@RequestBody NewFolder newFolder) {
        //用户id
        newFolder.setModifyTime(new Date());
        newFolder.setModifyBy(111L);
        boolean flag = newFolderService.updateById(newFolder);
        if (flag) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }


    @ApiOperation("删除文件夹")
    @PostMapping("/delete")
    public CommonResult<?> delete(Long id) {
        boolean flag = newFolderService.update(new LambdaUpdateWrapper<NewFolder>().set(NewFolder::getDeleted, 1).eq(NewFolder::getId, id));
        if (flag) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }


}
