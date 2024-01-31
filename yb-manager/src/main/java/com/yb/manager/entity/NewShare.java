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
 * 
 * @TableName new_share
 */
@TableName(value ="new_share")
@Data
public class NewShare implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 文件名称
     */
    @TableField(value = "file_name")
    private String fileName;

    /**
     * 文件后缀
     */
    @TableField(value = "ico")
    private String ico;

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
     * 文件类别
     */
    @TableField(value = "file_type")
    private String fileType;

    /**
     * 文件 id
     */
    @TableField(value = "file_id")
    private Long fileId;

    /**
     * 文件路径
     */
    @TableField(exist = false)
    private String filePath;

    /**
     * 是否公开
     */
    @TableField(value = "open")
    private Boolean open;

    /**
     * 分享码
     */
    @TableField(value = "share_code")
    private String shareCode;

    /**
     * 取件码
     */
    @TableField(value = "pickup_code")
    private String pickupCode;

    /**
     * 状态 0：已失效、1：永久有效、自定义天数
     */
    @TableField(value = "state")
    private Integer state;

    @TableField(exist = false)
    private String stateVal;

    /**
     * 下载次数
     */
    @TableField(value = "views")
    private Long views;

    /**
     * 上传者
     */
    @TableField(value = "created_by")
    private Long createdBy;

    @TableField(exist = false)
    private String createdByName;

    /**
     * 创建时间
     */
    @TableField(value = "created_time")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createdTime;

    /**
     * 修改者
     */
    @TableField(value = "modify_by")
    private Long modifyBy;

    /**
     * 最后更新时间
     */
    @TableField(value = "modify_time")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
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

    /**
     * 共享人id
     */
    @TableField(value = "share_obj")
    private String shareObj;

    /**
     * 共享权限
     */
    @TableField(value = "share_auth")
    private String shareAuth;

    @TableField(exist = false)
    private JSONObject shareAuthVal;


    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}