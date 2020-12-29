package com.hklmart.persistence;

import com.hklmart.domain.*;

import java.util.List;

public interface ManagementDAO {

    List<ProductListDTO> getProductList(PageCriteriaVO cri);

    List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri);

    List<BoardReviewListDTO> getBoardReviewList(PageCriteriaVO cri);

    List<MemberListDTO> getMemberList(PageCriteriaVO cri);

    ProductModifyDTO getModify(String productCode);

    BoardAskDTO getAskAnswer(String boardAskNumber);

}
