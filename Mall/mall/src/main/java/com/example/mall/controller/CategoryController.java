package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.Category;
import com.example.mall.mapper.CategoryMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private CategoryMapper categoryMapper;

    @GetMapping("/toAdd")
    public String toAdd() {
        return "addCategory";
    }

    @GetMapping("/query")
    public String query(@RequestParam Long merchantId,
                        HttpServletRequest request) {
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Category::getMerchantId, merchantId);
        List<Category> categories = categoryMapper.selectList(wrapper);
        request.setAttribute("categories", categories);
        return "categoryList";
    }

    @Transactional
    @PostMapping("/create")
    public String create(Category category,
                         HttpServletRequest request) {
        categoryMapper.insert(category);
        return query(category.getMerchantId(), request);
    }
}
