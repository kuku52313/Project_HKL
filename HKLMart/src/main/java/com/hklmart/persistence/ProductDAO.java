package com.hklmart.persistence;

import com.hklmart.domain.ProductVO;
import com.hklmart.domain.StockVO;

public interface ProductDAO {
	void saveFile(ProductVO productVO);

	void saveStock(StockVO stockVO);
	
	int codeCheck(String insertCode);

	void modifyFile(ProductVO productVO);

	void modifyStock(StockVO stockVO);
}
