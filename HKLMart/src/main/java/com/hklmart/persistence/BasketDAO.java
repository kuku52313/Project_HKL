package com.hklmart.persistence;

import org.springframework.stereotype.Repository;

@Repository
public interface BasketDAO {
    public void putProductBasket(String memberId, String productCode);

    public void takeProductBasket(String memberId);
}
