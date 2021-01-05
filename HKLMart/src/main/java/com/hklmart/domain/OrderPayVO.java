package com.hklmart.domain;

import lombok.Data;

@Data
public class OrderPayVO {

  /* "ORDER_NUMBER" NUMBER,
     "ORDER_MEMBER_ID" VARCHAR2(15 BYTE),
	"ORDER_PRODUCT" CHAR(6 BYTE),
	"ORDER_DATE" DATE DEFAULT sysdate,
    "ORDER_ADDRESS" VARCHAR2(150 BYTE),
	"ORDER_STATE" VARCHAR2(60 BYTE) DEFAULT '주문 접수 처리중',
    "ORDER_NAME" VARCHAR2(15 BYTE),
	"ORDER_MEMO" VARCHAR2(60 BYTE),
	"ORDER_TEL" CHAR(11 BYTE),
	"ORDER_PAYMENT" NUMBER,
    "ORDER_ADDRESS_MEMBER" VARCHAR2(150 BYTE),
	"ORDER_ADDRESS_POSTCODE" VARCHAR2(10 BYTE)*/

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

   private String stockSizeColumn;







}
