package com.hklmart.controller;

import com.hklmart.service.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequestMapping("/basket")
public class BasketController {

    @Autowired
    private BasketService basket;

    @PostMapping("/put")
    public void putProductBasket(Principal principal, @RequestParam("productCode") String productCode) {
        basket.putProductBasket(principal.getName(), productCode);
    }

    @GetMapping("/take")
    public String takeProductBasket(Principal principal) {
        basket.takeProductBasket(principal.getName());
        return "basket";
    }
}
