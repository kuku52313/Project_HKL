package com.hklmart.domain;

import lombok.Data;

@Data
public class PageCriteriaVO {
    private int pageNum;
    private int amount;

    public PageCriteriaVO() {
        this(1,10);
    }

    public PageCriteriaVO(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
