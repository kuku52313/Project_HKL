package com.hklmart.domain;
import lombok.Data;

import java.util.List;

@Data
public class BasketOrderPayListVO {

    private List<BasketOrderVO> orderList;
    private String orderProductCode;
    private String orderMemberId;
    private String orderName;
    private String orderTel;
    private String orderState;
    private String orderMemo;
    private String orderAddress;
    private String orderAddressMember;
    private String orderAddressPostcode;
    private String stockSizeColumn;
    private String stockSize;
    private int orderListNumber;
    private int orderListOrderNumber;
    private int orderPayment;

}
