package com.yb.manager.controller;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.yb.common.pojo.CommonResult;

import com.yb.manager.entity.NewFile;
import com.yb.manager.entity.NewFolder;
import com.yb.manager.service.NewFileService;
import com.yb.manager.service.NewFolderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author liming
 * @Date 2024/1/9 16:09
 */
@Api(tags = "文件操作")
@RestController
@RequestMapping("/file")
@RequiredArgsConstructor
public class FileController {

    private final NewFileService newFileService;

    private final NewFolderService newFolderService;

    /**
     * 显示文件和文件夹列表
     * @param folderId
     * @param fileName
     * @param startTime
     * @param endTime
     * @param fileType
     * @return
     */
    @GetMapping("list")
    @ApiOperation("根据文件夹id查询文件和文件夹")
    public CommonResult<Map<String, Object>> list(Long folderId, String fileName, String startTime, String endTime, String fileType) {
        Map<String, Object> resMap = new HashMap<>();
        List<NewFile> fileList = newFileService.fileList(folderId, fileName, startTime, endTime, fileType);
        List<NewFolder> folderList = newFolderService.folderList(folderId, fileName, startTime, endTime);
        resMap.put("fileList", fileList);
        resMap.put("folderList", folderList);
        return CommonResult.data(resMap);
    }



    @ApiOperation("添加文件")
    @PostMapping("/add")
    public CommonResult<NewFile> add(@RequestBody NewFile newFile) {
        boolean save = newFileService.saveFile(newFile);
        if (save) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }


    @ApiOperation("编辑文件")
    @PostMapping("/update")
    public CommonResult<NewFile> update(@RequestBody NewFile newFile) {
        newFile.setModifyTime(new Date());
        newFile.setModifyBy(111L);
        boolean flag = newFileService.updateById(newFile);
        if (flag) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }


    @ApiOperation("删除文件")
    @PostMapping("/delete")
    public CommonResult<?> delete(Long id) {
        boolean flag = newFileService.update(new LambdaUpdateWrapper<NewFile>()
                .set(NewFile::getDeleted, 1)
                .eq(NewFile::getId, id));
        if (flag) {
            return CommonResult.ok();
        } else {
            return CommonResult.error();
        }
    }


}
