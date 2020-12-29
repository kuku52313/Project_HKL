package com.hklmart.service;

import com.hklmart.domain.*;
import com.hklmart.persistence.ManagementDAO;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class ManagementService {

    private final ManagementDAO management;

    public ManagementService(ManagementDAO management) {
        this.management = management;
    }

    public List<ProductListDTO> getProductList(PageCriteriaVO cri) {
        return management.getProductList(cri);
    }

    public List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri) {
        return management.getAskBoardList(cri);
    }

    public List<BoardReviewListDTO> getBoardReviewList(PageCriteriaVO cri) {
        return management.getBoardReviewList(cri);
    }

    public List<MemberListDTO> getMemberList(PageCriteriaVO cri) {
        return management.getMemberList(cri);
    }

    public ProductModifyDTO getModify(String productCode) {
        return management.getModify(productCode);
    }

    public BoardAskDTO getAskAnswer(String boardAskNumber) {
        return management.getAskAnswer(boardAskNumber);
    }
}
