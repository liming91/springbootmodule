package com.yb.manager.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @TableName new_file
 */
@TableName(value = "new_file")
@Data
public class NewFile implements Serializable {
    /**
     *
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 目录 id
     */
    @TableField(value = "folder_id")
    private Long folderId;

    /**
     * 文件夹名称
     */
    @TableField(exist = false)
    private String folderName;

    /**
     * 0:
     */
    @TableField(value = "type")
    private Long type;

    /**
     * 文件名称
     */
    @TableField(value = "file_name")
    private String fileName;

    /**
     * 文件类型
     */
    @TableField(value = "file_type")
    private String fileType;

    /**
     * 文件大小
     */
    @TableField(value = "file_size")
    private Long fileSize;


    /**
     * 文件大小单位转换
     */
    @TableField(exist = false)
    private String fileSizeVal;

    /**
     * 文件唯一指纹
     */
    @TableField(value = "file_md5")
    private String fileMd5;

    /**
     * 存储名称
     */
    @TableField(value = "store_name")
    private String storeName;

    /**
     * 是否公开
     */
    @TableField(value = "open")
    private Boolean open;

    /**
     * 图标类型
     */
    @TableField(value = "ico")
    private String ico;

    /**
     * 预览地址
     */
    @TableField(value = "thumb")
    private String thumb;

    /**
     * 上传者
     */
    @TableField(value = "created_by")
    private Long createdBy;

    /**
     * 用户姓名
     */
    @TableField(exist = false)
    private String createdByName;

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
    private JSONObject shareAuthVal;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}