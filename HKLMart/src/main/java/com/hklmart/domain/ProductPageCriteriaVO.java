package com.hklmart.domain;

import lombok.Data;

@Data
public class ProductPageCriteriaVO {
    private int pageNum;
    private int amount;
    private int Type;

 /*   public ProductPageCriteriaVO(int pageNum, int amount, int Type) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.Type = Type;
    }*/
}
