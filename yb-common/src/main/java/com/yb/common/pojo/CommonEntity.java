package com.yb.common.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 * 通用基础字段实体：创建时间、创建人、修改时间、修改人，需要此通用字段的实体可继承此类，
 * 继承此类要求数据表有对应的字段
 * </p>
 */
@Getter
@Setter
public class CommonEntity implements Serializable {

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间", position = 1000)
    @TableField(value = "created_at", fill = FieldFill.INSERT)
    private LocalDateTime createdAt;


    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间", position = 1002)
    @TableField(value = "updated_at", fill = FieldFill.UPDATE)
    private LocalDateTime updatedAt;
}
