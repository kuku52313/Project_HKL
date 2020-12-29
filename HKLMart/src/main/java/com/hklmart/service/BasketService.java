package com.hklmart.service;

import com.hklmart.persistence.BasketDAO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BasketService {

    private final BasketDAO basket;

    public BasketService(BasketDAO basket) {
        this.basket = basket;
    }

    public void putProductBasket(String memberId, String productCode) {
        basket.putProductBasket(memberId, productCode);
    }

    public List<String> takeProductBasket(String memberId) {
        return basket.takeProductBasket(memberId);
    }
}
