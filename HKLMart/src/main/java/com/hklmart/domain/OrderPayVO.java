package com.hklmart.domain;
import lombok.Data;

@Data
public class OrderPayVO {

    private int orderNumber;
    private String orderMemberId;
    private String orderProductCode;
    private String orderDate;
    private String orderAddress;
    private String orderAddressMember;
    private String orderAddressPostcode;
    private String orderTel;
    private String orderMemo;
    private int orderPayment;
    private String orderState;
    private String orderName;
    private int orderListOrderNumber;
    private int orderListNumber;
    private String stockSizeColumn;
    private String stockSize;

}
