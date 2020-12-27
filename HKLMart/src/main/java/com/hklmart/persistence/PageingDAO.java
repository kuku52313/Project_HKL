package com.hklmart.persistence;

import com.hklmart.domain.PageCriteriaVO;

public interface PageingDAO {

    public int getAskBoardListTotalCount(PageCriteriaVO cri);
}
