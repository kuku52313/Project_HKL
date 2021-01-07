package com.hklmart.domain;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;
import oracle.sql.NUMBER;

import java.sql.Date;


@Data
public class orderProductListDTO {

    /*"ORDER_LIST_ORDER_NUMBER" NUMBER,
            "ORDER_LIST_PRODUCT" CHAR(6 BYTE),
	"ORDER_LIST_STOCK_240" NUMBER,
            "ORDER_LIST_STOCK_245" NUMBER,
            "ORDER_LIST_STOCK_250" NUMBER,
            "ORDER_LIST_STOCK_255" NUMBER,
            "ORDER_LIST_STOCK_260" NUMBER,
            "ORDER_LIST_STOCK_265" NUMBER,
            "ORDER_LIST_STOCK_270" NUMBER,
            "ORDER_LIST_STOCK_275" NUMBER,
            "ORDER_LIST_STOCK_280" NUMBER,
            "ORDER_LIST_STOCK_285" NUMBER,
            "ORDER_LIST_STOCK_290" NUMBER,
            "ORDER_LIST_STOCK_295" NUMBER*/

    private String orderListProduct;
    private String stockSize;
    private String productName;
    private int stockEA;

    private String orderNumber;
    private String orderState;
    private String orderPayment;
    private String orderAddress;
    private String orderAddressPostcode;
    private String orderAddressMember;
    private Date orderDate;



    private String productCode;
    private String productBrand;
    private String productPrice;
    private String productType;
    private String productImgPath;
    private String productImg;
    private String productThumbnail;
    private String productContent;
    private Date productRegdate;

    @Setter(AccessLevel.PROTECTED)
    private int orderListStock240;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock245;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock250;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock255;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock260;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock265;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock270;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock275;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock280;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock285;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock290;
    @Setter(AccessLevel.PROTECTED)
    private int orderListStock295;

    protected void setOrderListStock240(int orderListStock240) {
        stockSize = "240 Size";
        stockEA = orderListStock240;
    }
    protected void setOrderListStock245(int orderListStock245) {
        stockSize = "245 Size";
        stockEA = orderListStock245;
    }
    protected void setOrderListStock250(int orderListStock250) {
        stockSize = "250 Size";
        stockEA = orderListStock250;
    }
    protected void setOrderListStock255(int orderListStock255) {
        stockSize = "255 Size";
        stockEA = orderListStock255;
    }
    protected void setOrderListStock260(int orderListStock260) {
        stockSize = "260 Size";
        stockEA = orderListStock260;
    }
    protected void setOrderListStock265(int orderListStock265) {
        stockSize = "265 Size";
        stockEA = orderListStock265;
    }
    protected void setOrderListStock270(int orderListStock270) {
        stockSize = "270 Size";
        stockEA = orderListStock270;
    }
    protected void setOrderListStock275(int orderListStock275) {
        stockSize = "275 Size";
        stockEA = orderListStock275;
    }
    protected void setOrderListStock280(int orderListStock280) {
        stockSize = "280 Size";
        stockEA = orderListStock280;
    }
    protected void setOrderListStock285(int orderListStock285) {
        stockSize = "285 Size";
        stockEA = orderListStock285;
    }
    protected void setOrderListStock290(int orderListStock290) {
        stockSize = "290 Size";
        stockEA = orderListStock290;
    }
    protected void setOrderListStock295(int orderListStock295) {
        stockSize = "295 Size";
        stockEA = orderListStock295;
    }

}
