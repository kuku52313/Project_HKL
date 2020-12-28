package com.hklmart.persistence;

import com.hklmart.domain.PageCriteriaVO;

public interface PageingDAO {

    public int getAskBoardListTotalCount(PageCriteriaVO cri);

    public int getMemberListTotalCount(PageCriteriaVO cri);

    public int getReviewListTotalCount(PageCriteriaVO cri);

    public int getProductListTotalCount(PageCriteriaVO cri);

}
