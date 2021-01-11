package com.hklmart.domain;
import lombok.Data;

@Data
public class BasketOrderVO {

    private String productCode;
    private int productSize;
    private int productNumber;
    private int productPrice;

}
