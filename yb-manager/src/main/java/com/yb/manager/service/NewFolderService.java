package com.yb.manager.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.yb.manager.entity.NewFolder;
import com.yb.manager.entity.vo.NewFolderVO;

import java.util.List;

/**
 * @author Y
 * @description 针对表【new_folder】的数据库操作Service
 * @createDate 2024-01-09 14:54:24
 */
public interface NewFolderService extends IService<NewFolder> {

    /**
     * 根据 id 查询所有父节点
     *
     * @param id
     * @return
     */
    List<NewFolder> findParentById(Long id);

    /**
     * 根据父id查询文件夹
     *
     * @param parentId
     * @return
     */
    List<NewFolder> folderList(Long parentId,String fileName,String startTime,String endTime);

    boolean saveFolder(NewFolder newFolder);

    /**
     * 查询所有的子节点
     * @param id
     * @return
     */
    List<NewFolderVO> getChildNode(Long id);
}
