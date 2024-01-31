package com.yb.manager.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文件树
 * @Author liming
 * @Date 2024/1/11 16:00
 */
@Data
public class NewFolderVO {

    /**
     *
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 文件夹名称
     */
    @TableField(value = "folder_name")
    private String folderName;

    /**
     * 父id
     */
    @TableField(value = "parent_id")
    private Long parentId;

    /**
     * type
     */
    @TableField(value = "type")
    private Long type;

    /**
     * 创建者姓名
     */
    @TableField(exist = false)
    private String createdByName;

    /**
     * 父路径名称
     */
    @TableField(exist = false)
    private String parentName;

    /**
     * 创建者
     */
    @TableField(value = "created_by")
    private Long createdBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @TableField(value = "created_time")
    private Date createdTime;

    /**
     * 修改者
     */
    @TableField(value = "modify_by")
    private Long modifyBy;

    /**
     * 最后更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @TableField(value = "modify_time")
    private Date modifyTime;

    /**
     * 乐观锁
     */
    @TableField(value = "version")
    private Long version;

    /**
     * 逻辑删除
     */
    @TableField(value = "deleted")
    private Integer deleted;

    @TableField(exist = false)
    List<NewFolderVO> children =new ArrayList<>();
}
