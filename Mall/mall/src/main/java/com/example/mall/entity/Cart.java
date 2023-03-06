package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class Cart {

    private Long id;

    private Long userId;

    private Long productId;

    private Integer quantity;

    private Long merchantId;

    @TableField(exist = false)
    private String productName;

    @TableField(exist = false)
    private BigDecimal total;
}
