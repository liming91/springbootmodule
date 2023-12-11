package com.yb.manager.mapper;

import com.yb.manager.entity.Test;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yb.manager.entity.vo.TestVO;

import java.util.List;

/**
* @author Y
* @description 针对表【test】的数据库操作Mapper
* @createDate 2023-12-11 15:03:56
* @Entity com.yb.manager.entity.Test
*/
public interface TestMapper extends BaseMapper<Test> {

    List<TestVO> getSevenDate();
}




