package com.hklmart.domain;

import lombok.Data;

@Data
public class ProductListDTO {
	
	private String productName;
	private String productCode;
	private String productBrand;
	private String productPrice;
	private String productKind;
	
//	public String getProductName() {
//		return productName;
//	}
//	public void setProductName(String productName) {
//		this.productName = productName;
//	}
//	public String getProductCode() {
//		return productCode;
//	}
//	public void setProductCode(String productCode) {
//		this.productCode = productCode;
//	}
//	public String getProductBrand() {
//		return productBrand;
//	}
//	public void setProductBrand(String productBrand) {
//		this.productBrand = productBrand;
//	}
//	public String getProductPrice() {
//		return productPrice;
//	}
//	public void setProductPrice(String productPrice) {
//		this.productPrice = productPrice;
//	}
//	public String getProductKind() {
//		return productKind;
//	}
//	public void setProductKind(String productKind) {
//		
//		
//		//운동화
//		if(Integer.parseInt(productKind) == 11) {
//			productKind = "스니커즈";
//		}
//		if(Integer.parseInt(productKind) == 12) {
//			productKind = "캔버스화";
//		}
//		if(Integer.parseInt(productKind) == 13) {
//			productKind = "슬립온";
//		}
//		
//		
//		//스포츠
//		if(Integer.parseInt(productKind) == 31) {
//			productKind = "런닝화";
//		} 
//		if(Integer.parseInt(productKind) == 32) {
//			productKind = "축구화";
//		}
//		if(Integer.parseInt(productKind) == 33) {
//			productKind = "등산화";
//		}
//		
//		//구두
//		if(Integer.parseInt(productKind) == 51) {
//			productKind = "로퍼";
//		}
//		if(Integer.parseInt(productKind) == 52) {
//			productKind = "레이스업";
//		}
//		if(Integer.parseInt(productKind) == 53) {
//			productKind = "힐/펌프스";
//		}
//		if(Integer.parseInt(productKind) == 54) {
//			productKind = "플랫슈즈";
//		}
//		
//		//부츠
//		if(Integer.parseInt(productKind) == 71) {
//			productKind = "첼시부츠";
//		}
//		if(Integer.parseInt(productKind) == 72) {
//			productKind = "워크부츠";
//		}
//		if(Integer.parseInt(productKind) == 73) {
//			productKind = "퍼부츠";
//		}
//		
//		
//		
//		this.productKind = productKind;
//	}
//	
}
