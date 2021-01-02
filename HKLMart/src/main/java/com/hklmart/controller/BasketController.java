package com.hklmart.controller;

import com.hklmart.service.BasketService;
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

    public BasketController(BasketService basket) {
        this.basket = basket;
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
}
