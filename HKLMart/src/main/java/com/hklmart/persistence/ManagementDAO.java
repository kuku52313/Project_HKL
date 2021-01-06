package com.hklmart.persistence;

import com.hklmart.domain.*;

import java.lang.reflect.Member;
import java.util.List;

public interface ManagementDAO {

    List<ProductListDTO> getProductList(PageCriteriaVO cri);

    List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri);

    List<BoardReviewListDTO> getBoardReviewList(PageCriteriaVO cri);

    List<MemberListDTO> getMemberList(PageCriteriaVO cri);

    ProductModifyDTO getModify(String productCode);

    BoardAskDTO getAskAnswer(String boardAskNumber);

    MemberModifyDTO getManageMember(String memberId);

    void deleteAskManager(String boardAskNumber);

    void deleteManagerProduct(String productCode);

    void deleteReviewManager(String boardReviewNumber);

    void deleteMember(String memberId);

    List<OrderViewVO> getOrderList(PageCriteriaVO cri);

    OrderViewVO getOrderModify(String orderNumber);

    List<orderProductListDTO> getOrderProduct(String orderNumber);
}
