package com.hklmart.service;

import com.hklmart.persistence.BasketDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BasketService {

    @Autowired
    private BasketDAO basket;

    public void putProductBasket(String basketMemberId, String basketProductCode) {
        basket.putProductBasket(basketMemberId, basketProductCode);
    }

    public void takeProductBasket(String memberId){
        basket.takeProductBasket(memberId);
    }
}
