package com.yb.manager.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yb.manager.entity.NewFolder;
import com.yb.manager.entity.vo.NewFolderVO;
import com.yb.manager.mapper.NewFolderMapper;
import com.yb.manager.service.NewFolderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Y
 * @description 针对表【new_folder】的数据库操作Service实现
 * @createDate 2024-01-09 14:54:24
 */
@Slf4j
@Service
public class NewFolderServiceImpl extends ServiceImpl<NewFolderMapper, NewFolder>
        implements NewFolderService {


    @Override
    public List<NewFolderVO> getChildNode(Long id) {

        List<NewFolderVO> dataList = this.baseMapper.getChildNode(id, "0");
        List<NewFolderVO> resultList = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(dataList)) {
            Map<Long, NewFolderVO> map = dataList.stream().distinct().collect(Collectors.toMap(NewFolderVO::getId, m -> m, (m1, m2) -> m1));
            dataList.forEach(m -> {
                if (m.getParentId() == 0) {
                    resultList.add(m);
                } else {
                    NewFolderVO newFolderVO = map.get(m.getParentId());
                    if (ObjectUtil.isNotEmpty(newFolderVO)) {
                        newFolderVO.getChildren().add(m);
                    }
                }
            });
        }
        return resultList;
    }

    @Override
    public List<NewFolder> findParentById(Long id) {
        return this.baseMapper.findParentById(id);
    }

    @Override
    public List<NewFolder> folderList(Long parentId, String fileName,String startTime,String endTime) {
        List<NewFolder> list = this.baseMapper.folderList(null,parentId,fileName,startTime,endTime);
        list.forEach(folder -> {
            folder.setCreatedByName("admin");
        });
        return list;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveFolder(NewFolder newFolder) {
        boolean flag = false;

        //查询有没有根目录
        newFolder.setCreatedTime(new Date());
        newFolder.setCreatedBy(111L);
        newFolder.setModifyTime(new Date());
        newFolder.setModifyBy(111L);
        newFolder.setParentId(newFolder.getParentId() == null ? 0 : newFolder.getParentId());
        try {
            flag = this.save(newFolder);
        } catch (Exception e) {
            log.error("创建文件夹异常：{}", e.getMessage());
            throw new RuntimeException(e);
        }
        return flag;
    }

}




