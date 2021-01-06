package com.hklmart.persistence;

import com.hklmart.domain.BasketVO;

import java.util.List;

public interface BasketDAO {

    void putProductBasket(String memberId, String productCode);

    List<String> takeProductBasket(String basketMemberId);

    int checkBasket(String memberId, String productCode);

    List<BasketVO> orderBasket(String basketMemberId);

    void remove(String memberId, String productCode);

}
