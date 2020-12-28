package com.hklmart.persistence;

import java.util.List;

import com.hklmart.domain.*;


public interface ManagementDAO {
	
	public List<ProductListDTO> getProductList(PageCriteriaVO cri);

	public List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri);

	public List<BoardReviewListDTO> getBoardReviewList(PageCriteriaVO cri);

	public List<MemberListDTO> getMemberList(PageCriteriaVO cri);

	public ProductModifyDTO getModify(String productCode);

	public BoardAskDTO getAskAnswer(String boardAskNumber);
	
}
