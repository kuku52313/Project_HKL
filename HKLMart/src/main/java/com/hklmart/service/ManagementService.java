package com.hklmart.service;

import com.hklmart.domain.*;
import com.hklmart.persistence.ManagementDAO;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class ManagementService {

    private final ManagementDAO managementDAO;

    public ManagementService(ManagementDAO managementDAO) {
        this.managementDAO = managementDAO;
    }

    public List<ProductListDTO> getProductList(PageCriteriaVO cri) {
        return managementDAO.getProductList(cri);
    }

    public List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri) {
        return managementDAO.getAskBoardList(cri);
    }

    public List<BoardReviewListDTO> getBoardReviewList(PageCriteriaVO cri) {
        return managementDAO.getBoardReviewList(cri);
    }

    public List<MemberListDTO> getMemberList(PageCriteriaVO cri) {
        return managementDAO.getMemberList(cri);
    }

    public ProductModifyDTO getModify(String productCode) {
        return managementDAO.getModify(productCode);
    }

    public MemberModifyDTO getManageMember(String memberId) {
        return managementDAO.getManageMember(memberId);
    }

    public BoardAskDTO getAskAnswer(String boardAskNumber) {
        return managementDAO.getAskAnswer(boardAskNumber);
    }

    public void deleteAskManager(String boardAskNumber) { managementDAO.deleteAskManager(boardAskNumber); }

    public void deleteManagerProduct(String productCode){
        managementDAO.deleteManagerProduct(productCode);
    }

    public void deleteReviewManager(String boardReviewNumber) { managementDAO.deleteReviewManager(boardReviewNumber); }

    public void deleteMember(String memberId) { managementDAO.deleteMember(memberId); }

    public List<OrderViewVO> getOrderList(PageCriteriaVO cri) {
        return managementDAO.getOrderList(cri);
    }
}
