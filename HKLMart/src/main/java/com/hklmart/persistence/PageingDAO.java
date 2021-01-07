package com.hklmart.persistence;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductPageCriteriaVO;

public interface PageingDAO {

    public int getAskBoardListTotalCount(PageCriteriaVO cri);

    public int getMemberListTotalCount(PageCriteriaVO cri);

    public int getReviewListTotalCount(PageCriteriaVO cri);

    public int getProductListTotalCount(PageCriteriaVO cri);

    public int getUserProductListTotalCount(ProductPageCriteriaVO cri);

    public int getMainCategoryUserProductListTotalCount(ProductPageCriteriaVO cri);

    public int getReviewProductTotalCount(ProductPageCriteriaVO cri);

    public int getUserAskListTotalCount(ProductPageCriteriaVO cri);

    public int getUserReviewListTotalCount(ProductPageCriteriaVO cri);

    int getOrderListTotal(PageCriteriaVO cri);

    int getUserOrderListTotal(ProductPageCriteriaVO cri);
}
