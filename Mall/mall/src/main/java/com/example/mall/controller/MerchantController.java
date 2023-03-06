package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.Merchant;
import com.example.mall.mapper.MerchantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/merchant")
public class MerchantController {

    @Resource
    private MerchantMapper merchantMapper;

    @Autowired
    private OrderController ordercontroller;

    @GetMapping("")
    public String toLogin() {
        return "merchantLogin";
    }

    @GetMapping("/toAdd")
    public String toAdd() {
        return "addMerchant";
    }

    @GetMapping("/info")
    public String info(HttpServletRequest request) {
        return "merchantInfo";
    }

    @GetMapping("/query")
    public String query(HttpServletRequest request) {
        List<Merchant> merchants = merchantMapper.selectList(null);
        request.setAttribute("merchants", merchants);
        return "adminMerchantManager";
    }


    @Transactional
    @PostMapping("/create")
    public String create(Merchant merchant,
                         HttpServletRequest request) throws IOException {

        MultipartFile blFile = merchant.getUploadFile();
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
            merchant.setIcon("http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + newFileName);
        }
        merchantMapper.insert(merchant);
        return query(request);
    }

    @Transactional
    @GetMapping("/delete")
    public String delete(@RequestParam Long id,
                         HttpServletRequest request) {
        merchantMapper.deleteById(id);
        return query(request);
    }

    @Transactional
    @PostMapping("/update")
    public String update(Merchant merchant,
                         HttpServletRequest request) throws IOException {
        Merchant old = merchantMapper.selectById(merchant.getId());
        MultipartFile blFile = merchant.getUploadFile();
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
            old.setIcon("http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + newFileName);
        }
        if (StringUtils.hasText(merchant.getArea())) {
            old.setArea(merchant.getArea());
        }
        if (StringUtils.hasText(merchant.getMerchantName())) {
            old.setMerchantName(merchant.getMerchantName());
        }
        if (StringUtils.hasText(merchant.getPassword())) {
            old.setPassword(merchant.getPassword());
        }
        if (StringUtils.hasText(merchant.getPayee())) {
            old.setPayee(merchant.getPayee());
        }
        if (StringUtils.hasText(merchant.getShroffAccountNumber())) {
            old.setShroffAccountNumber(merchant.getShroffAccountNumber());
        }
        if (StringUtils.hasText(merchant.getText1())) {
            old.setText1(merchant.getText1());
        }
        if (StringUtils.hasText(merchant.getText2())) {
            old.setText2(merchant.getText2());
        }
        if (StringUtils.hasText(merchant.getText3())) {
            old.setText3(merchant.getText3());
        }
        merchantMapper.updateById(old);
        request.getSession().setAttribute("merchantUser", old);
        return "merchantInfo";
    }

    @PostMapping("/login")
    public String login(Merchant merchant,
                        HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        LambdaQueryWrapper<Merchant> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Merchant::getLoginName, merchant.getLoginName());
        wrapper.eq(Merchant::getPassword, merchant.getPassword());
        Merchant result = merchantMapper.selectOne(wrapper);
        if (result == null) {
            response.getWriter().write("Incorrect login name or password");
            response.getWriter().flush();
            response.getWriter().close();
            return null;
        }
        request.getSession().setAttribute("merchantUser", result);
        return ordercontroller.merchantQuery(result.getId(), request);
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("merchantUser");
        return "merchantLogin";
    }
}
