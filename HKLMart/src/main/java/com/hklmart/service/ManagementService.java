package com.hklmart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewListVO;
import com.hklmart.domain.ProductListVO;
import com.hklmart.persistence.ManagementDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ManagementService {

	@Autowired
	ManagementDAO managmentDAO;
	
	public List<ProductListVO> getProductList() {
		
		return managmentDAO.getProductList();
	}

	public List<BoardAskVO> getAskBoardList() {
		
		return managmentDAO.getAskBoardList();
	}

	public List<BoardReviewListVO> getBoardReviewList() {
		
		return managmentDAO.getBoardReviewList();
	}
	
	
}
