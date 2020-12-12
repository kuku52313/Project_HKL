package com.hklmart.persistence;

import java.util.List;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.ProductListDTO;


public interface ManagementDAO {
	
	public List<ProductListDTO> getProductList();

	public List<BoardAskVO> getAskBoardList();
}
