package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.mall.enums.OrderStatusEnum;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@TableName(value = "tb_order")
public class Order {

    private Long id;

    private Long userId;

    private Long merchantId;

    private BigDecimal total;

    private String transferAccount;

    private String transferNumber;

    private String transcript;

    private Date paymentTime;

    private OrderStatusEnum status;

    private Date orderTime;

    private String logisticsCompany;

    private String logisticsNumber;

    private String receiverAddress;

    private String remark;

    private Date cancelTime;

    private String reason;

    @TableField(exist = false)
    private Merchant merchant;

}
