package com.hklmart.persistence;
import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductPageCriteriaVO;

public interface PageingDAO {

    int getAskBoardListTotalCount(PageCriteriaVO cri);

    int getMemberListTotalCount(PageCriteriaVO cri);

    int getReviewListTotalCount(PageCriteriaVO cri);

    int getProductListTotalCount(PageCriteriaVO cri);

    int getUserProductListTotalCount(ProductPageCriteriaVO cri);

    int getMainCategoryUserProductListTotalCount(ProductPageCriteriaVO cri);

    int getReviewProductTotalCount(ProductPageCriteriaVO cri);

    int getUserAskListTotalCount(ProductPageCriteriaVO cri);

    int getUserReviewListTotalCount(ProductPageCriteriaVO cri);

    int getOrderListTotal(PageCriteriaVO cri);

    int getUserOrderListTotal(ProductPageCriteriaVO cri);

    int getLikeListTotal(PageCriteriaVO cri, String memberId);

}
