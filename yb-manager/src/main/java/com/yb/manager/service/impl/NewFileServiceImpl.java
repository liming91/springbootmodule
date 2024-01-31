package com.yb.manager.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yb.common.util.FileUtil;
import com.yb.manager.entity.NewFile;
import com.yb.manager.mapper.NewFileMapper;
import com.yb.manager.service.NewFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author Y
 * @description 针对表【new_file】的数据库操作Service实现
 * @createDate 2024-01-09 14:55:18
 */
@Slf4j
@Service
public class NewFileServiceImpl extends ServiceImpl<NewFileMapper, NewFile>
        implements NewFileService {

    @Override
    public List<NewFile> fileList(Long folderId, String fileName, String startTime, String endTime, String fileType) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("download", true);
        jsonObject.put("look", true);

        List<NewFile> list = this.baseMapper.fileList(null, folderId, fileName, startTime, endTime, fileType);
        list.forEach(file -> {
            file.setCreatedByName("admin");
            file.setFileSizeVal(FileUtil.getSize(file.getFileSize()));
            file.setShareAuthVal(jsonObject);
        });
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveFile(NewFile newFile) {
        boolean flag = false;
        try {
            newFile.setCreatedTime(new Date());
            newFile.setOpen(true);
            newFile.setType(1L);
            newFile.setCreatedBy(111L);
            newFile.setFolderId(newFile.getFolderId() == null ? 0 : newFile.getFolderId());
            flag = this.save(newFile);
        } catch (Exception e) {
            log.error("添加文件异常=====：{}", e.getMessage());
            throw new RuntimeException(e);
        }
        return flag;
    }

}




