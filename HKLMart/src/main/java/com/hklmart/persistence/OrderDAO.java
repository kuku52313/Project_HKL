package com.hklmart.persistence;


import com.hklmart.domain.BasketOrderPayListVO;
import com.hklmart.domain.CheckStockVO;
import com.hklmart.domain.OrderPayVO;
import com.hklmart.domain.OrderVO;

public interface OrderDAO {

    OrderVO getOrderMemberService(String memberId);

    OrderVO getOrderProductService(String productCode);

    int checkStock(CheckStockVO checkStockVO);

    void doPay(OrderPayVO orderPayVO);

    void doPay(BasketOrderPayListVO basketOrderPayListVO);

    void payProductList(OrderPayVO orderPayVO);

    void payProductList(BasketOrderPayListVO basketOrderPayListVO);

    void stockUpdate(OrderPayVO orderPayVO);

    void stockUpdate(BasketOrderPayListVO basketOrderPayListVO);
}
