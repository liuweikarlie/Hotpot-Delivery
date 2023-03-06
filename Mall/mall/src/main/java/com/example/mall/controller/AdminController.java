package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.Admin;
import com.example.mall.mapper.AdminMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminMapper adminMapper;

    @GetMapping("")
    public String toLogin() {
        return "adminLogin";
    }

    @GetMapping("login")
    public String login(@RequestParam String loginName,
                        @RequestParam String password,
                        HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        LambdaQueryWrapper<Admin> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Admin::getLoginName, loginName);
        wrapper.eq(Admin::getPassword, password);
        Admin result = adminMapper.selectOne(wrapper);
        if (result == null) {
            response.getWriter().write("Incorrect login name or password");
            response.getWriter().flush();
            response.getWriter().close();
            return null;
        }
        request.getSession().setAttribute("admin", result);
        return "adminHome";
    }
}
