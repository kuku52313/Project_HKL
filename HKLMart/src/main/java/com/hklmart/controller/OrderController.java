package com.hklmart.controller;

import com.hklmart.domain.CheckStockVO;
import com.hklmart.domain.OrderPayVO;
import com.hklmart.service.OrderService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.swing.*;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Log4j
@Controller
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/order-page")
    public String goOrderPage(Principal principal, @RequestParam("productCode") String productCode, Model model) {

        String memberId = principal.getName();
        model.addAttribute("memberInfo",orderService.getOrderMemberService(memberId));
        model.addAttribute("productInfo",orderService.getOrderProdutService(productCode));
        return "order";
    }

    @PostMapping("/pay")
    public String doPay(Principal principal,OrderPayVO orderPayVO) {
        orderPayVO.setOrderMemberId(principal.getName());

        log.info(orderPayVO);

        orderService.doPay(orderPayVO);

        orderService.payProductList(orderPayVO);

        return "redirect:/member/my-page";
    }

    @GetMapping("/check-stock")
    @ResponseBody
    public Map<String,Object> checkStock(CheckStockVO checkStockVO) {

        log.info(checkStockVO);

        Map<String,Object> checkStockCnt = new HashMap<>();

        checkStockCnt.put("cnt",orderService.checkStock(checkStockVO));

        return checkStockCnt;
    }

}
