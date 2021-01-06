package com.hklmart.controller;

import com.hklmart.domain.BasketOrderPayListVO;
import com.hklmart.domain.BasketOrderVO;
import com.hklmart.domain.CheckStockVO;
import com.hklmart.domain.OrderPayVO;
import com.hklmart.service.BasketService;
import com.hklmart.domain.OrderViewVO;
import com.hklmart.service.OrderService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Log4j
@Controller
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final BasketService bakset;

    public OrderController(OrderService orderService, BasketService bakset) {
        this.orderService = orderService;
        this.bakset = bakset;
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
        orderService.stockUpdate(orderPayVO);

        return "redirect:/member/my-page";
    }

    @GetMapping("/check-stock")
    @ResponseBody
    public Map<String, Object> checkStock(CheckStockVO checkStockVO) {

        log.info(checkStockVO);

        Map<String, Object> checkStockCnt = new HashMap<>();

        checkStockCnt.put("cnt", orderService.checkStock(checkStockVO));

        return checkStockCnt;
    }

    @PostMapping("/basket-payment")
    public String basketPayment(BasketOrderPayListVO orderPayListVO) {
        for (BasketOrderVO temp : orderPayListVO.getOrderList()) {
            orderPayListVO.setOrderPayment(temp.getProductPrice());
            orderPayListVO.setStockSize("STOCK_" + temp.getProductSize());
            orderPayListVO.setStockSizeColumn("ORDER_LIST_STOCK_" + temp.getProductSize());
            orderPayListVO.setOrderProductCode(temp.getProductCode());
            orderService.doPay(orderPayListVO);
            orderService.payProductList(orderPayListVO);
            orderService.stockUpdate(orderPayListVO);
            bakset.remove(orderPayListVO.getOrderMemberId(), orderPayListVO.getOrderProductCode());
        }
        return "redirect:/member/my-page";
    }

}
