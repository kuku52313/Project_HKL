package com.hklmart.service;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.persistence.PageingDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageService {

    @Autowired
    PageingDAO pageingDAO;

    public int getAskBoardListTotal(PageCriteriaVO cri) {
        return pageingDAO.getAskBoardListTotalCount(cri);
    }

    public int getMemberListTotal(PageCriteriaVO cri) {
        return pageingDAO.getMemberListTotalCount(cri);
    }
}
