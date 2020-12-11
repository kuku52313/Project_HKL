package com.hklmart.persistence;

import java.util.List;

import com.hklmart.domain.ProductVO;


public interface ManagementDAO {
	
	public List<ProductVO> getProductList();
}
