package com.hklmart.service;

import java.util.List;

import com.hklmart.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hklmart.persistence.ManagementDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ManagementService {

	@Autowired
	ManagementDAO managmentDAO;
	
	public List<ProductListDTO> getProductList(PageCriteriaVO cri) {
		
		return managmentDAO.getProductList(cri);
	}

	public List<BoardAskDTO> getAskBoardList(PageCriteriaVO cri) {
		
		return managmentDAO.getAskBoardList(cri);
	}

	public List<BoardReviewListDTO> getBoardReviewList(PageCriteriaVO cri) {
		
		return managmentDAO.getBoardReviewList(cri);
	}

	public List<MemberListDTO> getMemberList(PageCriteriaVO cri) {

		return managmentDAO.getMemberList(cri);
	}

	public ProductModifyDTO getModify(String productCode) {
		
		return managmentDAO.getModify(productCode);
	}

	public BoardAskDTO getAskAnswer(String boardAskNumber) {
	
		return managmentDAO.getAskAnswer(boardAskNumber);
	}
	
	
}
