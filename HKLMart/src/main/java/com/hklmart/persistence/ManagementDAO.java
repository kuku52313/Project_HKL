package com.hklmart.persistence;

import java.util.List;

import com.hklmart.domain.*;


public interface ManagementDAO {
	
	public List<ProductListDTO> getProductList();

	public List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri);

	public List<BoardReviewListDTO> getBoardReviewList();

	public List<MemberListDTO> getMemberList();

	public ProductModifyDTO getModify(String productCode);

	public BoardAskDTO getAskAnswer(String boardAskNumber);
	
}
