package com.yb.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yb.manager.entity.NewFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author Y
 * @description 针对表【new_file】的数据库操作Mapper
 * @createDate 2024-01-09 14:55:18
 * @Entity com.yb.system.entity.NewFile
 */
public interface NewFileMapper extends BaseMapper<NewFile> {

    List<NewFile> fileList(@Param("userId") Integer userId, @Param("folderId") Long folderId,
                           @Param("fileName") String fileName, @Param("startTime") String startTime,
                           @Param("endTime") String endTime, @Param("fileType") String fileType);
}




