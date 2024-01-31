package com.yb.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yb.manager.entity.NewShare;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Y
* @description 针对表【new_share】的数据库操作Mapper
* @createDate 2024-01-12 15:45:50
* @Entity com.yb.system.entity.NewShare
*/
public interface NewShareMapper extends BaseMapper<NewShare> {

    List<NewShare> shareList(@Param("userId") Integer userId,@Param("id") Long id,@Param("fileName")String fileName,
                             @Param("startTime") String startTime,@Param("endTime") String endTime);


}




