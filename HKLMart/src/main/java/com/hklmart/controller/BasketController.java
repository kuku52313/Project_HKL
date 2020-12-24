package com.hklmart.controller;

import com.hklmart.service.BasketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/basket")
public class BasketController {

    private final BasketService basket;

    public BasketController(BasketService basket) {
        this.basket = basket;
    }

    @PostMapping("/put")
    public void putProductBasket(Principal principal, @RequestParam("productCode") String productCode) {
        basket.putProductBasket(principal.getName(), productCode);
    }

    @GetMapping("/take")
    public String takeProductBasket(Principal principal, Model model) {
        List<String> productList = basket.takeProductBasket(principal.getName());
        model.addAttribute("productList", productList);
        return "my-page";
    }
}
