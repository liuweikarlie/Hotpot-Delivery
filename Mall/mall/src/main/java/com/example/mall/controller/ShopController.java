package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.Merchant;
import com.example.mall.mapper.MerchantMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class ShopController {

    @Resource
    private MerchantMapper merchantMapper;

    @GetMapping("/findByArea")
    public String findByArea(@RequestParam String area,
                             HttpServletRequest request) {
        LambdaQueryWrapper<Merchant> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Merchant::getArea, area);
        List<Merchant> merchants = merchantMapper.selectList(wrapper);
        request.setAttribute("shops", merchants);
        request.setAttribute("area", area);
        return "shop";
    }

}
