package com.yb.manager.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.yb.manager.entity.NewFile;

import java.util.List;

/**
 * @author Y
 * @description 针对表【new_file】的数据库操作Service
 * @createDate 2024-01-09 14:55:18
 */
public interface NewFileService extends IService<NewFile> {
    /**
     * 文件列表
     *
     * @param folderId
     * @return
     */
    List<NewFile> fileList(Long folderId, String fileName, String startTime, String endTime, String fileType);

    boolean saveFile(NewFile newFile);
}
