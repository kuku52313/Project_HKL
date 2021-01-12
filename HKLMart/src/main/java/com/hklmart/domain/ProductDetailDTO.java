package com.hklmart.domain;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

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
        this.productImg = productImg.replace('\\', '/');
    }

    protected void setProductImgpath(String productImgpath) {
        this.productImgpath = productImgpath.replace('\\', '/');
    }

    protected void setProductThumbnail(String productThumbnail) {
        this.productThumbnail = productThumbnail.replace('\\', '/');
    }

    protected void setProductContent(String productContent) {
        this.productContent = productContent.replace('\\', '/');
    }

}
