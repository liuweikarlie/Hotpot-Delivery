package com.example.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.mall.entity.*;
import com.example.mall.enums.OrderStatusEnum;
import com.example.mall.mapper.*;
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
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private CartMapper cartMapper;

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private OrderDetailMapper orderDetailMapper;

    @Resource
    private ProductMapper productMapper;

    @Resource
    private MerchantMapper merchantMapper;

    @Transactional
    @PostMapping("/create")
    public String create(@RequestParam Long merchantId,
                         @RequestParam Long userId,
                         @RequestParam String address,
                         @RequestParam(required = false) String input,
                         @RequestParam BigDecimal total,
                         @RequestParam String transferAccount,
                         @RequestParam String transferNumber,
                         @RequestParam MultipartFile blFile,
                         @RequestParam(required = false) String remark,
                         HttpServletRequest request) throws IOException {
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
        String transcript = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + newFileName;

        if ("useInput".equals(address)) {
            address = input;
        }
        LambdaQueryWrapper<Cart> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Cart::getMerchantId, merchantId);
        wrapper.eq(Cart::getUserId, userId);
        List<Cart> cartList = cartMapper.selectList(wrapper);
        cartList = cartList.stream().filter(cart -> {
            Product product = productMapper.selectById(cart.getProductId());
            return product.getStock() > 0;
        }).collect(Collectors.toList());
        if (!CollectionUtils.isEmpty(cartList)) {
            Order order = new Order();
            order.setMerchantId(merchantId);
            order.setUserId(userId);
            order.setStatus(OrderStatusEnum.WAIT_CONFIRM);
            order.setPaymentTime(new Date());
            order.setReceiverAddress(address);
            order.setTotal(total);
            order.setTransferAccount(transferAccount);
            order.setTransferNumber(transferNumber);
            order.setTranscript(transcript);
            order.setRemark(remark);
            orderMapper.insert(order);
            for (Cart cart : cartList) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(order.getId());
                orderDetail.setProductId(cart.getProductId());
                orderDetail.setQuantity(cart.getQuantity());
                Product product = productMapper.selectById(cart.getProductId());
                product.setStock(product.getStock() - cart.getQuantity());
                productMapper.updateById(product);
                orderDetail.setPrice(product.getPrice());
                BigDecimal itemTotal = BigDecimal.valueOf(cart.getQuantity()).multiply(product.getPrice());
                orderDetail.setTotal(itemTotal);
                orderDetailMapper.insert(orderDetail);
            }
        }
        List<Cart> carts = cartMapper.selectList(wrapper);
        if (!CollectionUtils.isEmpty(carts)) {
            cartMapper.deleteBatchIds(carts.stream().map(Cart::getId).collect(Collectors.toList()));
        }
        return "index";
    }

    @GetMapping("/checkout")
    public String checkout(@RequestParam Long merchantId,
                           @RequestParam Long userId,
                           HttpServletRequest request) {
        LambdaQueryWrapper<Cart> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Cart::getMerchantId, merchantId);
        wrapper.eq(Cart::getUserId, userId);
        List<Cart> carts = cartMapper.selectList(wrapper);
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
        return "settlement";
    }

    @GetMapping("/adminQuery")
    public String adminQuery(HttpServletRequest request) {
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Order::getId);
        List<Order> orders = orderMapper.selectList(wrapper);
        if (!CollectionUtils.isEmpty(orders)) {
            orders.forEach(order -> {
                Merchant merchant = merchantMapper.selectById(order.getMerchantId());
                order.setMerchant(merchant);
            });
        }
        request.setAttribute("orders", orders);
        return "adminOrderList";
    }


    @Transactional
    @GetMapping("/adminConfirm")
    public String adminConfirm(@RequestParam Long id,
                             HttpServletRequest request) {
        Order order = orderMapper.selectById(id);
        order.setStatus(OrderStatusEnum.DELIVERY);
        orderMapper.updateById(order);
        return adminQuery(request);
    }


    @GetMapping("/merchantQuery")
    public String merchantQuery(@RequestParam Long merchantId,
                                HttpServletRequest request) {
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Order::getMerchantId, merchantId);
        List<OrderStatusEnum> statusEnumList = Arrays.asList(OrderStatusEnum.DELIVERY, OrderStatusEnum.RECEIVE, OrderStatusEnum.COMPLETE, OrderStatusEnum.CANCEL);
        wrapper.in(Order::getStatus, statusEnumList);
        wrapper.orderByDesc(Order::getId);
        List<Order> orders = orderMapper.selectList(wrapper);
        if (!CollectionUtils.isEmpty(orders)) {
            orders.forEach(order -> {
                Merchant merchant = merchantMapper.selectById(order.getMerchantId());
                order.setMerchant(merchant);
            });
        }
        request.setAttribute("orders", orders);
        return "merchantOrderList";
    }

    @GetMapping("/deliver")
    public String deliver(@RequestParam Long orderId,
                          @RequestParam String logisticsCompany,
                          @RequestParam String logisticsNumber,
                          HttpServletRequest request) {
        Order order = orderMapper.selectById(orderId);
        order.setStatus(OrderStatusEnum.RECEIVE);
        order.setLogisticsCompany(logisticsCompany);
        order.setLogisticsNumber(logisticsNumber);
        orderMapper.updateById(order);
        return merchantQuery(order.getMerchantId(), request);
    }

    @GetMapping("/merchantCancel")
    public String merchantCancel(@RequestParam Long id,
                                 @RequestParam String reason,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws IOException {
        Order order = orderMapper.selectById(id);
        boolean canCancel = System.currentTimeMillis() - order.getOrderTime().getTime() < 15 * 60 * 1000;
        if (!canCancel) {
            response.getWriter().write("Unable to cancel after 15 minutes");
            response.getWriter().flush();
            response.getWriter().close();
            return null;
        }
        order.setCancelTime(new Date());
        order.setStatus(OrderStatusEnum.CANCEL);
        order.setReason(reason);
        orderMapper.updateById(order);
        return merchantQuery(order.getMerchantId(), request);
    }

    @GetMapping("/userQuery")
    public String userQuery(HttpServletRequest request) {
        Object userObj = request.getSession().getAttribute("user");
        if (userObj == null) {
            return "userLogin";
        }
        User user = (User) userObj;
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Order::getUserId, user.getId());
        wrapper.orderByDesc(Order::getId);
        List<Order> orders = orderMapper.selectList(wrapper);
        if (!CollectionUtils.isEmpty(orders)) {
            orders.forEach(order -> {
                Merchant merchant = merchantMapper.selectById(order.getMerchantId());
                order.setMerchant(merchant);
            });
        }
        request.setAttribute("orders", orders);
        return "userOrder";
    }

    @GetMapping("/orderDetail")
    public String orderDetail(@RequestParam Long orderId,
                              HttpServletRequest request) {
        LambdaQueryWrapper<OrderDetail> detailWrapper = new LambdaQueryWrapper<>();
        detailWrapper.eq(OrderDetail::getOrderId, orderId);
        List<OrderDetail> orderDetails = orderDetailMapper.selectList(detailWrapper);
        orderDetails.forEach(orderDetail -> {
            Product product = productMapper.selectById(orderDetail.getProductId());
            orderDetail.setProduct(product);
        });
        request.setAttribute("details", orderDetails);
        return "orderDetail";
    }

    @GetMapping("/receiver")
    public String receiver(@RequestParam Long orderId,
                              HttpServletRequest request) {
        Order order = orderMapper.selectById(orderId);
        order.setStatus(OrderStatusEnum.COMPLETE);
        orderMapper.updateById(order);
        return userQuery(request);
    }

    @GetMapping("/userCancel")
    public String userCancel(@RequestParam Long orderId,
                             HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        Order order = orderMapper.selectById(orderId);
        boolean canCancel = System.currentTimeMillis() - order.getOrderTime().getTime() < 15 * 60 * 1000;
        if (!canCancel) {
            response.getWriter().write("Unable to cancel after 15 minutes");
            response.getWriter().flush();
            response.getWriter().close();
            return null;
        }
        order.setStatus(OrderStatusEnum.CANCEL);
        order.setReason("User Cancel");
        orderMapper.updateById(order);
        return userQuery(request);
    }

}
