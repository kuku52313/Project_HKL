package com.hklmart.persistence;


import com.hklmart.domain.*;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface OrderDAO {

    OrderVO getOrderMemberService(String memberId);

    OrderVO getOrderProductService(String productCode);

    int checkStock(CheckStockVO checkStockVO);

    void doPay(OrderPayVO orderPayVO);

    void payProductList(OrderPayVO orderPayVO);

    void stockUpdate(OrderPayVO orderPayVO);

    OrderViewVO getOrderModify(String orderNumber);
}
