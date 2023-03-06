package com.example.mall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class User {

    private Long id;

    private String username;

    private String phoneNumber;

    private String password;

    private String defaultAddress;

    private String icon;

    @TableField(exist = false)
    private MultipartFile uploadFile;

    private Date createTime;
}
