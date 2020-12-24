package com.hklmart.service;

import com.hklmart.persistence.BasketDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BasketService {

    @Autowired
    private BasketDAO basket;

    public void putProductBasket(String memberId, String productCode) {
        basket.putProductBasket(memberId, productCode);
    }

    public List<String> takeProductBasket(String memberId){
        return basket.takeProductBasket(memberId);
    }
}
