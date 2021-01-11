package com.hklmart.domain;
import lombok.Data;

@Data
public class BasketVO {

    private String basketMemberId;
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
    private String productImgpath;
    private String productImg;
    private String productThumbnail;

}
