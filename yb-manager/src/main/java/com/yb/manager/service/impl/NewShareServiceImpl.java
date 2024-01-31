package com.yb.manager.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yb.common.util.FileUtil;
import com.yb.common.util.IdUtils;
import com.yb.manager.entity.NewFile;
import com.yb.manager.entity.NewShare;
import com.yb.manager.entity.dto.ShareDTO;
import com.yb.manager.mapper.NewFileMapper;
import com.yb.manager.mapper.NewShareMapper;
import com.yb.manager.service.NewShareService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @author Y
 * @description 针对表【new_share】的数据库操作Service实现
 * @createDate 2024-01-12 15:45:50
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class NewShareServiceImpl extends ServiceImpl<NewShareMapper, NewShare>
        implements NewShareService {

    private final NewFileMapper newFileMapper;


    @Override
    public List<NewShare> shareList(Long id, String fileName, String startTime, String endTime) {
        List<NewShare> list = this.baseMapper.shareList(0, id, fileName, startTime, endTime);
        if (CollectionUtils.isNotEmpty(list)) {
            list.forEach(x -> {
                x.setCreatedByName("admin");
                String shareAuth = x.getShareAuth();
                x.setShareAuthVal(JSON.parseObject(shareAuth));
                x.setFileSizeVal(FileUtil.getSize(x.getFileSize()));
            });
        }
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addShare(ShareDTO shareDTO) {
        int rows = 0;
        try {
            //删除
            this.baseMapper.delete(new LambdaQueryWrapper<NewShare>().eq(NewShare::getFileId, shareDTO.getFileId()));
            //查询共享的文件
            NewFile file = newFileMapper.selectById(shareDTO.getFileId());
            Optional.ofNullable(file).orElseThrow(() -> new RuntimeException("文件不能为空！"));
            NewShare newShare = new NewShare();
            newShare.setFileName(file.getFileName());
            newShare.setIco(file.getIco());
            newShare.setFileSize(file.getFileSize());
            newShare.setFileType(file.getFileType());
            //共享码
            newShare.setFileId(Long.valueOf(shareDTO.getFileId()));
            newShare.setOpen(shareDTO.getOpen());
            newShare.setShareCode(IdUtils.createdOne(file.getId()));
            newShare.setPickupCode(IdUtils.getCode());
            newShare.setState(-1);
            newShare.setCreatedBy(111L);
            newShare.setCreatedTime(new Date());
            newShare.setModifyBy(111L);
            newShare.setModifyTime(new Date());
            newShare.setDeleted(0);
            newShare.setShareObj(shareDTO.getShareObj());
            newShare.setShareAuth(JSONObject.toJSONString(shareDTO.getShareAuth()));
            rows = this.baseMapper.insert(newShare);

            //修改文件状态
            LambdaUpdateWrapper<NewFile> fileUpdateWrapper = new LambdaUpdateWrapper<NewFile>().set(NewFile::getOpen, shareDTO.getOpen())
                    .eq(NewFile::getId, shareDTO.getFileId());
            newFileMapper.update(null, fileUpdateWrapper);
        } catch (RuntimeException e) {
            log.error("共享文件异常：{}", e.getMessage());
            throw new RuntimeException(e);
        }
        return rows;
    }

    @Override
    public NewShare detail(Long id) {
        LambdaQueryWrapper<NewShare> entity = new LambdaQueryWrapper<NewShare>().eq(NewShare::getDeleted, 0)
                .eq(NewShare::getFileId, id);
        NewShare newShare = this.baseMapper.selectOne(entity);
        if (ObjectUtil.isNotEmpty(newShare)) {
            String shareAuth = newShare.getShareAuth();
            newShare.setShareAuthVal(JSON.parseObject(shareAuth));
        }
        return newShare;
    }

}




