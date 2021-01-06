package com.hklmart.service;

import com.hklmart.domain.BasketVO;
import com.hklmart.domain.ProductVO;
import com.hklmart.domain.StockVO;
import com.hklmart.persistence.BasketDAO;
import com.hklmart.persistence.ProductDAO;
import com.hklmart.persistence.StockDAO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BasketService {

    private final BasketDAO basket;
    private final ProductDAO product;
    private final StockDAO stock;

    public BasketService(BasketDAO basket, ProductDAO product, StockDAO stock) {
        this.basket = basket;
        this.product = product;
        this.stock = stock;
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
        List<BasketVO> orderBasketList = basket.orderBasket(basketMemberId);
        return orderBasketList;
    }

    public Map<String, StockVO> getStockList(String basketMemberId) {
        Map<String, StockVO> stockList = new HashMap<>();
        List<BasketVO> orderBasketList = basket.orderBasket(basketMemberId);
        for (BasketVO temp : orderBasketList) {
            stockList.put(temp.getProductCode(), stock.getStock(temp.getProductCode()));
        }
        return stockList;
    }
}
