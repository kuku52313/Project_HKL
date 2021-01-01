package com.hklmart.domain;

import lombok.Data;

@Data
public class ProductPageCriteriaVO {
    private int pageNum;
    private int amount;
    private int pageNumReview;
    private int Type;
    private String productCode;
    private String memberId;

}
