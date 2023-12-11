package com.yb.manager.service;

import com.yb.manager.entity.Test;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yb.manager.entity.vo.TestVO;

import java.util.List;

/**
* @author Y
* @description 针对表【test】的数据库操作Service
* @createDate 2023-12-11 15:03:56
*/
public interface TestService extends IService<Test> {

    List<TestVO> getSevenDate();
}
