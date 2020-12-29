package com.hklmart.persistence;

import java.util.List;

public interface BasketDAO {

    void putProductBasket(String memberId, String productCode);

    List<String> takeProductBasket(String basketMemberId);

}
