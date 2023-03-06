package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName(value = "order_detail")
public class OrderDetail {

    private Long id;

    private Long orderId;

    private Long productId;

    private Integer quantity;

    private BigDecimal price;

    private BigDecimal total;

    @TableField(exist = false)
    private Product product;
}
