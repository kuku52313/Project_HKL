package com.hklmart.persistence;

import org.apache.ibatis.annotations.Param;

public interface BasketDAO {
    void putProductBasket(@Param("basketMemberId") String basketMemberId, @Param("basketProductCode") String basketProductCode);

    void takeProductBasket(String basketMemberId);
}
