package com.hklmart.controller;

import com.hklmart.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

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
        model.addAttribute("prductInfo",orderService.getOrderProdutService(productCode));
        return "order";
    }

}
