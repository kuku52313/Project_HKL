package com.hklmart.service;

import com.hklmart.domain.BasketOrderPayListVO;
import com.hklmart.domain.CheckStockVO;
import com.hklmart.domain.OrderPayVO;
import com.hklmart.domain.OrderVO;
import com.hklmart.domain.OrderViewVO;
import com.hklmart.persistence.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    private final OrderDAO orderDAO;

    public OrderService(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }


    public OrderVO getOrderMemberService(String memberId) {

        return orderDAO.getOrderMemberService(memberId);
    }

    public OrderVO getOrderProdutService(String productCode) {
        return orderDAO.getOrderProductService(productCode);
    }

    public int checkStock(CheckStockVO checkStockVO) {

        return orderDAO.checkStock(checkStockVO);
    }

    public void doPay(OrderPayVO orderPayVO) {
        orderDAO.doPay(orderPayVO);
    }

    public void doPay(BasketOrderPayListVO basketOrderPayListVO) {
        orderDAO.doPay(basketOrderPayListVO);
    }


    public void payProductList(OrderPayVO orderPayVO) {
        orderDAO.payProductList(orderPayVO);
    }

    public void payProductList(BasketOrderPayListVO basketOrderPayListVO) {
        orderDAO.payProductList(basketOrderPayListVO);
    }

    public void stockUpdate(OrderPayVO orderPayVO) {
        orderDAO.stockUpdate(orderPayVO);
    }

    public void stockUpdate(BasketOrderPayListVO basketOrderPayListVO) {
        orderDAO.stockUpdate(basketOrderPayListVO);
    }
}
