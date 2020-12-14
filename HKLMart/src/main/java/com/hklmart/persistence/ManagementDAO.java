package com.hklmart.persistence;

import java.util.List;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewListVO;
import com.hklmart.domain.ProductListVO;


public interface ManagementDAO {
	
	public List<ProductListVO> getProductList();

	public List<BoardAskVO> getAskBoardList();

	public List<BoardReviewListVO> getBoardReviewList();
}
