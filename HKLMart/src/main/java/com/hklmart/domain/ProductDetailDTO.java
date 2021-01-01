package com.hklmart.domain;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

import java.util.Date;

@Data
public class ProductDetailDTO {
    private String productName;
    private String productCode;
    private String productBrand;
    private String productPrice;
    private String productType;
    @Setter(AccessLevel.PROTECTED)
    private String productContent;
    @Setter(AccessLevel.PROTECTED)
    private String productImgpath;
    @Setter(AccessLevel.PROTECTED)
    private String productImg;
    @Setter(AccessLevel.PROTECTED)
    private String productThumbnail;
    private int stock240;
    private int stock245;
    private int stock250;
    private int stock255;
    private int stock260;
    private int stock265;
    private int stock270;
    private int stock275;
    private int stock280;
    private int stock285;
    private int stock290;
    private int stock295;



    protected void setProductImg(String productImg) {
        String pathReplace = productImg.replace('\\', '/');
        this.productImg = pathReplace;
    }

    protected void setProductImgpath(String productImgpath) {
        String pathReplace = productImgpath.replace('\\', '/');
        this.productImgpath = pathReplace;
    }

    protected void setProductThumbnail(String productThumbnail) {
        String pathReplace = productThumbnail.replace('\\', '/');
        this.productThumbnail = pathReplace;
    }

    protected void setProductContent(String productContent) {
        String pathReplace = productContent.replace('\\', '/');
        this.productContent = pathReplace;
    }
}
