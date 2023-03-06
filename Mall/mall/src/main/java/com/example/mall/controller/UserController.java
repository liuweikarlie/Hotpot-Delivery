package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.User;
import com.example.mall.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserMapper userMapper;

    @GetMapping("/toLogin")
    public String toLogin() {
        return "userLogin";
    }

    @GetMapping("/toRegister")
    public String toRegister() {
        return "userRegister";
    }

    @GetMapping("/info")
    public String info() {
        return "user";
    }

    @PostMapping("/register")
    public String register(User user,
                           HttpServletRequest request) throws IOException {

        MultipartFile blFile = user.getUploadFile();
        if (!blFile.isEmpty()) {
            String oldFileName = blFile.getOriginalFilename();
            File path = new File(ResourceUtils.getURL("classpath:").getPath() + "static");
            String randomStr = UUID.randomUUID().toString();
            String newFileName = randomStr + oldFileName.substring(oldFileName.lastIndexOf("."));
            File file = new File(path, newFileName);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            System.out.println(path.getPath());
            System.out.println(newFileName);
            blFile.transferTo(file);
            user.setIcon("http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + newFileName);
        }
        userMapper.insert(user);
        return "userLogin";
    }

    @GetMapping("/toUpdatePassword")
    public String toUpdatePassword() {
        return "userPassword";
    }

    @PostMapping("/login")
    public String login(User user,
                        HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getPhoneNumber, user.getPhoneNumber());
        wrapper.eq(User::getPassword, user.getPassword());
        User result = userMapper.selectOne(wrapper);
        if (result == null) {
            response.getWriter().write("Incorrect phone number or password");
            response.getWriter().flush();
            response.getWriter().close();
            return null;
        }
        request.setAttribute("result", true);
        request.getSession().setAttribute("user", result);
        return "index";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "userLogin";
    }

    @Transactional
    @PostMapping("/update")
    public String update(User user,
                         HttpServletRequest request) {
        userMapper.updateById(user);
        return "user";
    }

}
