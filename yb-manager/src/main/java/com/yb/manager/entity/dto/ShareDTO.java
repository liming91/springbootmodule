package com.yb.manager.entity.dto;

import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 分享对象
 * @Author liming
 * @Date 2024/1/12 17:07
 */
@Data
public class ShareDTO {


    @ApiModelProperty("id")
    private String id;

    @ApiModelProperty("文件id")
    private String fileId;

    @ApiModelProperty("共享人id")
    private String shareObj;

    @ApiModelProperty("共享权限")
    private JSONObject shareAuth;

    @ApiModelProperty("共享状态：true共享 false关闭")
    private Boolean open;

}
