package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.mall.entity.Cart;
import com.example.mall.entity.Category;
import com.example.mall.entity.Merchant;
import com.example.mall.entity.Product;
import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.CategoryMapper;
import com.example.mall.mapper.MerchantMapper;
import com.example.mall.mapper.ProductMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ResourceUtils;
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
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductMapper productMapper;

    @Resource
    private CategoryMapper categoryMapper;

    @Resource
    private CartMapper cartMapper;

    @Resource
    private MerchantMapper merchantMapper;

    @GetMapping("/toAdd")
    public String toAdd(HttpServletRequest request) {
        Object merchantUser = request.getSession().getAttribute("merchantUser");
        if (merchantUser == null) {
            return "merchantLogin";
        }
        Merchant merchant = (Merchant) merchantUser;
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Category::getMerchantId, merchant.getId());
        List<Category> categories = categoryMapper.selectList(wrapper);
        request.setAttribute("categories", categories);
        return "addProduct";
    }

    @GetMapping("/toUpdate")
    public String toUpdate(@RequestParam Long id,
                           HttpServletRequest request) {
        Object merchantUser = request.getSession().getAttribute("merchantUser");
        if (merchantUser == null) {
            return "merchantLogin";
        }
        Product product = productMapper.selectById(id);
        request.setAttribute("product", product);
        Merchant merchant = (Merchant) merchantUser;
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Category::getMerchantId, merchant.getId());
        List<Category> categories = categoryMapper.selectList(wrapper);
        request.setAttribute("categories", categories);
        return "updateProduct";
    }

    @GetMapping("/findByMerchant")
    public String findByMerchant(@RequestParam Long merchantId,
                                 @RequestParam Long userId,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws IOException {

        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Category::getMerchantId, merchantId);
        wrapper.last(" limit 6");
        List<Category> categories = categoryMapper.selectList(wrapper);
        if (CollectionUtils.isEmpty(categories)) {
            response.getWriter().write("No goods or categories");
            response.getWriter().flush();
            response.getWriter().close();
            return null;
        }
        Long categoryId = categories.get(0).getId();
        request.getSession().setAttribute("merchantId", merchantId);
        return findByCategory(categoryId, 1, 999, userId, merchantId, request);
    }


    @GetMapping("/findByCategory")
    public String findByCategory(@RequestParam Long categoryId,
                                 @RequestParam Integer page,
                                 @RequestParam Integer size,
                                 @RequestParam Long userId,
                                 @RequestParam Long merchantId,
                                 HttpServletRequest request) {
        Merchant merchant = merchantMapper.selectById(merchantId);
        request.setAttribute("merchant", merchant);

        LambdaQueryWrapper<Category> categoryWrapper = new LambdaQueryWrapper<>();
        categoryWrapper.eq(Category::getMerchantId, merchantId);
        categoryWrapper.last(" limit 5");
        List<Category> categories = categoryMapper.selectList(categoryWrapper);
        request.setAttribute("categories", categories);
        request.setAttribute("categoryId", categoryId);
        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Product::getCategoryId, categoryId);
        wrapper.gt(Product::getStock, 0);
        Page<Product> productPage = productMapper.selectPage(new Page<>(page, size), wrapper);
        request.setAttribute("productPage", productPage);

        LambdaQueryWrapper<Cart> cartWrapper = new LambdaQueryWrapper<>();
        cartWrapper.eq(Cart::getMerchantId, merchantId);
        cartWrapper.eq(Cart::getUserId, userId);
        List<Cart> carts = cartMapper.selectList(cartWrapper);
        carts = carts.stream().filter(cart -> {
            Product product = productMapper.selectById(cart.getProductId());
            return product.getStock() > 0;
        }).collect(Collectors.toList());
        BigDecimal total = BigDecimal.ZERO;
        if (!CollectionUtils.isEmpty(carts)) {
            total = carts.stream().map(cart -> {
                Product product = productMapper.selectById(cart.getProductId());
                cart.setProductName(product.getProductName());
                BigDecimal itemTotal = product.getPrice().multiply(BigDecimal.valueOf(cart.getQuantity())).setScale(2, BigDecimal.ROUND_HALF_UP);
                cart.setTotal(itemTotal);
                return itemTotal;
            }).reduce(BigDecimal::add).orElse(BigDecimal.ZERO);
        }
        request.setAttribute("total", total);
        request.setAttribute("carts", carts);
        request.setAttribute("merchantId", merchantId);
        return "product";
    }

    @GetMapping("/merchantQuery")
    public String merchantQuery(@RequestParam Long merchantId,
                                HttpServletRequest request) {
        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Product::getMerchantId, merchantId);
        List<Product> products = productMapper.selectList(wrapper);
        if (!CollectionUtils.isEmpty(products)) {
            products.forEach(product -> {
                Category category = categoryMapper.selectById(product.getCategoryId());
                product.setCategory(category);
            });
        }
        request.setAttribute("products", products);
        return "merchantProduct";
    }

    @Transactional
    @PostMapping("/create")
    public String create(Product product,
                         HttpServletRequest request) throws IOException {
        MultipartFile blFile = product.getUploadFile();
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
            product.setImage("http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + newFileName);
        }
        productMapper.insert(product);
        return merchantQuery(product.getMerchantId(), request);
    }

    @Transactional
    @PostMapping("/merchantUpdate")
    public String merchantUpdate(Product product,
                                 HttpServletRequest request) throws IOException {
        MultipartFile blFile = product.getUploadFile();
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
            product.setImage("http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + newFileName);
        }
        productMapper.updateById(product);
        return merchantQuery(product.getMerchantId(), request);
    }

    @Transactional
    @GetMapping("/delete")
    public String delete(@RequestParam Long id,
                         HttpServletRequest request) {
        Product product = productMapper.selectById(id);
        LambdaQueryWrapper<Cart> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Cart::getProductId, id);
        cartMapper.delete(wrapper);
        productMapper.deleteById(id);
        return merchantQuery(product.getMerchantId(), request);
    }

}
