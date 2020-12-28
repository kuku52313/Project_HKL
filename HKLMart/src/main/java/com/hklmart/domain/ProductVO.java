package com.hklmart.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ProductVO {
	private String productCode;
	private String productName;
	private String productBrand;
	private String productPrice;
	private String productType;
	private String productImgPath;
	private String productImg;
	private String productThumbnail;
	private String productContent;
	private Date productRegdate;
}
