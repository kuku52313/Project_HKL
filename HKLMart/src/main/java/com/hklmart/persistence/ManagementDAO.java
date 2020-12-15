package com.hklmart.persistence;

import java.util.List;

import com.hklmart.domain.BoardAskDTO;
import com.hklmart.domain.BoardReviewListDTO;
import com.hklmart.domain.MemberListDTO;
import com.hklmart.domain.ProductListDTO;


public interface ManagementDAO {
	
	public List<ProductListDTO> getProductList();

	public List<BoardAskDTO> getAskBoardList();

	public List<BoardReviewListDTO> getBoardReviewList();

	public List<MemberListDTO> getMemberList();
}
