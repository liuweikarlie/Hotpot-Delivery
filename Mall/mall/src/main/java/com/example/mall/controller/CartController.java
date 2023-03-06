package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.Cart;
import com.example.mall.entity.Product;
import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Resource
    private CartMapper cartMapper;
    private Cart cart;
    @Resource
    private ProductMapper productMapper;

    @Autowired
    private ProductController productController;

    @Transactional
    @GetMapping("/addToCart")
    public String addToCart(@RequestParam Long merchantId,
                            @RequestParam Long userId,
                            @RequestParam Long productId,
                            @RequestParam Long categoryId,
                            @RequestParam Integer page,
                            @RequestParam Integer size,
                            HttpServletRequest request,
                            HttpServletResponse response) throws IOException {
        Product product = productMapper.selectById(productId);
        LambdaQueryWrapper<Cart> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Cart::getUserId, userId);
        wrapper.eq(Cart::getProductId, productId);
        Cart old = cartMapper.selectOne(wrapper);
        if (old == null) {
            Cart cart = new Cart();
            cart.setMerchantId(merchantId);
            cart.setProductId(productId);
            cart.setUserId(userId);
            cart.setQuantity(1);
            cartMapper.insert(cart);
        } else {
            if (product.getStock() < old.getQuantity() + 1) {
                response.getWriter().write("Stock shortage");
                response.getWriter().flush();
                response.getWriter().close();
                return null;
            }
            old.setQuantity(old.getQuantity() + 1);
            cartMapper.updateById(old);
        }
        return productController.findByCategory(categoryId, page, size, userId, merchantId, request);
    }

    @Transactional
    @GetMapping("/updateCart")
    public String updateCart(@RequestParam Long merchantId,
                             @RequestParam Long userId,
                             @RequestParam Long cartId,
                             @RequestParam Integer quantity,
                             @RequestParam Long categoryId,
                             @RequestParam Integer page,
                             @RequestParam Integer size,
                             HttpServletRequest request) {
        Cart cart = cartMapper.selectById(cartId);
        cart.setQuantity(cart.getQuantity() + quantity);
        if (cart.getQuantity() < 1) {
            cartMapper.deleteById(cartId);
        } else {
            cartMapper.updateById(cart);
        }
        return productController.findByCategory(categoryId, page, size, userId, merchantId, request);
    }

}
