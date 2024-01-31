package com.yb.manager.service;



import com.baomidou.mybatisplus.extension.service.IService;
import com.yb.manager.entity.NewShare;
import com.yb.manager.entity.dto.ShareDTO;

import java.util.List;

/**
* @author Y
* @description 针对表【new_share】的数据库操作Service
* @createDate 2024-01-12 15:45:50
*/
public interface NewShareService extends IService<NewShare> {

    List<NewShare> shareList(Long id,String fileName, String startTime, String endTime);

    int addShare(ShareDTO shareDTO);

    NewShare detail(Long id);
}
