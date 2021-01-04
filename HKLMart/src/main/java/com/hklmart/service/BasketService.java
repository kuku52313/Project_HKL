package com.hklmart.service;

import com.hklmart.domain.BasketVO;
import com.hklmart.domain.OrderVO;
import com.hklmart.domain.ProductVO;
import com.hklmart.persistence.BasketDAO;
import com.hklmart.persistence.ProductDAO;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Service
public class BasketService {

    private final BasketDAO basket;
    private final ProductDAO product;

    public BasketService(BasketDAO basket, ProductDAO product) {
        this.basket = basket;
        this.product = product;
    }

    public void putProductBasket(String memberId, String productCode) {
        basket.putProductBasket(memberId, productCode);
    }

    public List<String> takeProductBasket(String memberId) {
        return basket.takeProductBasket(memberId);
    }

    public int checkBasket(String memberId, String productCode) {
        return basket.checkBasket(memberId, productCode);
    }

    public List<ProductVO> basketList(String memberId) {
        List<String> codeList = basket.takeProductBasket(memberId);
        List<ProductVO> productList = new ArrayList<>();
        for (String code : codeList) {
            productList.add(product.getProductInfo(code));
        }
        return productList;
    }

    public List<BasketVO> orderBasket(String basketMemberId) {
        List<BasketVO> orderBasketList= basket.orderBasket(basketMemberId);

        return orderBasketList;
    }

}
