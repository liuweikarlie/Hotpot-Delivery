package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class Merchant {

    private Long id;

    private String merchantName;

    private String loginName;

    private String password;

    private String area;

    private String icon;

    @TableField(exist = false)
    private MultipartFile uploadFile;

    private String payee;

    private String shroffAccountNumber;

    private String text1;

    private String text2;

    private String text3;
}
