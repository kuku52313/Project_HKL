package com.hklmart.controller;

import com.hklmart.service.BasketService;
import com.hklmart.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/basket")
public class BasketController {

    private final BasketService basket;
    private final OrderService orderService;

    public BasketController(BasketService basket, OrderService orderService) {
        this.basket = basket;
        this.orderService = orderService;
    }

    @GetMapping("/check")
    @ResponseBody
    public Map<String, Object> checkBasket(Principal principal, @RequestParam("productCode") String productCode) {
        int count = basket.checkBasket(principal.getName(), productCode);
        if (count == 0) {
            basket.putProductBasket(principal.getName(), productCode);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("result", count);
        return map;
    }

    @PostMapping("/put")
    public void putProductBasket(Principal principal, @RequestParam("productCode") String productCode) {
        basket.putProductBasket(principal.getName(), productCode);
    }

    @GetMapping("/take")
    public String takeProductBasket(Principal principal, Model model) {
        model.addAttribute("basketList", basket.basketList(principal.getName()));
        return "forward:/like/take";
    }

    @GetMapping("/remove")
    public void removeBasket(Principal principal, @RequestParam("productCode") String productCode) {
        basket.remove(principal.getName(), productCode);
    }

    @GetMapping("/basket-page")
    public String orderBasket(Principal principal, Model model) {
        String basketMemberId = principal.getName();
        model.addAttribute("orderBasketList", basket.orderBasket(basketMemberId));
        model.addAttribute("shoesStockList", basket.getStockList(basketMemberId));
        model.addAttribute("memberInfo", orderService.getOrderMemberService(basketMemberId));
        return "/basket";
    }
}
