package com.hklmart.domain;
import lombok.Data;

import java.sql.Date;

@Data
public class OrderViewVO {

    private int orderNumber;
    private int orderPayment;
    private String orderMemberId;
    private String orderAddress;
    private String orderAddressMember;
    private String orderAddressPostcode;
    private String orderTel;
    private String orderMemo;
    private String orderState;
    private String orderName;
    private Date orderDate;

}
