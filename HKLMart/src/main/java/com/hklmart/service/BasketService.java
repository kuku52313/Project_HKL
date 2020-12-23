package com.hklmart.service;

import com.hklmart.persistence.BasketDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BasketService {

    @Autowired
    private BasketDAO basket;

    public void putProductBasket(String memberId, String productCode) {
        basket.putProductBasket(memberId, productCode);
    }

    public void takeProductBasket(String memberId){
        basket.takeProductBasket(memberId);
    }
}
