package com.hklmart.service;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductVO;

import java.util.List;

public interface ProductService {
	public void registProduct();
	public void deleteProduct();
	public List<ProductVO> getUserProductList(PageCriteriaVO cri);

}
