package com.hklmart.persistence;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductVO;
import com.hklmart.domain.StockVO;

import java.util.List;

public interface ProductDAO {
	void saveFile(ProductVO productVO);

	void saveStock(StockVO stockVO);

	int codeCheck(String insertCode);

	void modifyFile(ProductVO productVO);

	void modifyStock(StockVO stockVO);

	List<ProductVO> getUserProductList(PageCriteriaVO cri);

}
