package com.example.mall.enums;

import lombok.Getter;

@Getter
public enum OrderStatusEnum {


    WAIT_PAY("待付款"),

    WAIT_CONFIRM("待确认"),

    DELIVERY("待发货"),

    RECEIVE("待收货"),

    COMPLETE("已完成"),

    CANCEL("已取消");

    private String text;

    OrderStatusEnum(String text) {
        this.text = text;
    }
}
