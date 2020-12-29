package com.hklmart.service;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.persistence.PageingDAO;
import org.springframework.stereotype.Service;

@Service
public class PageService {

    private final PageingDAO pageingDAO;

    public PageService(PageingDAO pageingDAO) {
        this.pageingDAO = pageingDAO;
    }

    public int getAskBoardListTotal(PageCriteriaVO cri) {
        return pageingDAO.getAskBoardListTotalCount(cri);
    }

    public int getMemberListTotal(PageCriteriaVO cri) {
        return pageingDAO.getMemberListTotalCount(cri);
    }

    public int getReviewListTotal(PageCriteriaVO cri) {
        return pageingDAO.getReviewListTotalCount(cri);
    }

    public int getProductListTotal(PageCriteriaVO cri) {
        return pageingDAO.getProductListTotalCount(cri);
    }
}
