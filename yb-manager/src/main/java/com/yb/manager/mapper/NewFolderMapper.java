package com.yb.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yb.manager.entity.NewFolder;
import com.yb.manager.entity.vo.NewFolderVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author Y
 * @description 针对表【new_folder】的数据库操作Mapper
 * @createDate 2024-01-09 14:54:24
 * @Entity com.yb.system.entity.NewFolder
 */
public interface NewFolderMapper extends BaseMapper<NewFolder> {

    List<NewFolder> findParentById(Long id);

    List<NewFolderVO> getChildNode(@Param("id") Long id, @Param("userId") String userId);

    List<NewFolder> folderList(@Param("userId") Integer userId, @Param("parentId") Long parentId,
                               @Param("fileName") String fileName, @Param("startTime") String startTime,
                               @Param("endTime") String endTime);
}




