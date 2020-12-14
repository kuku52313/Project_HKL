package com.hklmart.domain;


import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
public class ProductListDTO {
	
	private String productName;
	private String productCode;
	private String productBrand;
	private String productPrice;
	
	@Setter(AccessLevel.PROTECTED)
	private String productType;
	
	protected void setProductType(String productType) {
		
		if(Integer.parseInt(productType)==11) {
			productType = "슬립온";
		}
		
		this.productType = productType;
		
	}
}
