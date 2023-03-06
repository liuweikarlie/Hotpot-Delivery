package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class Product {

    private Long id;

    private Long merchantId;

    private Long categoryId;

    private String productName;

    private String description;

    private String image;

    @TableField(exist = false)
    private MultipartFile uploadFile;

    private BigDecimal price;

    private Integer stock;

    private Date createTime;

    @TableField(exist = false)
    private Category category;
}
