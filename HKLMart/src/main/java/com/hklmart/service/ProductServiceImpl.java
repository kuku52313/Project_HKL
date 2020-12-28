package com.hklmart.service;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hklmart.persistence.ProductDAO;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public void registProduct() {
		
		
	}

	@Override
	public void deleteProduct() {
		
		
	}

	@Override
	public List<ProductVO> getUserProductList(PageCriteriaVO cri) {
		return productDAO.getUserProductList(cri);
	}

	public int codeCheckTest(String insertCode) {
		
		return productDAO.codeCheck(insertCode);
	}

}
