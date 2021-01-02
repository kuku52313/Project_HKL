package com.hklmart.domain;

import lombok.Data;

import java.util.Date;

@Data
public class OrderVO {
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberEmail;
    private String memberTel;
    private String memberAddress;
    private String memberAddressPostcode;
    private String memberAddressMember;

    private String productCode;
    private String productName;
    private String productBrand;
    private String productPrice;
    private String productImgPath;
    private String productImg;
    private String productThumbnail;


}
