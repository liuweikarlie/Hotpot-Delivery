package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.util.Date;

@Data
public class Category {

    private Long id;

    private Long merchantId;

    private String name;

    private Date createTime;

    @TableField(exist = false)
    private Category category;
}
