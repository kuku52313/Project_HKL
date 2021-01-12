package com.hklmart.domain;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
public class ProductListMainDTO {

    private String productName;
    private String productCode;
    private String productBrand;
    private String productPrice;
    @Setter(AccessLevel.PROTECTED)
    private String productContent;
    private String productRegdate;
    @Setter(AccessLevel.PROTECTED)
    private String productImgpath;
    @Setter(AccessLevel.PROTECTED)
    private String productImg;
    @Setter(AccessLevel.PROTECTED)
    private String productThumbnail;
    private String productType;

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
