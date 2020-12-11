package com.hklmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.domain.BoardReviewVO;
import com.hklmart.service.BoardServiceTest;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/testKim")
public class TestKimController {
	
	@Autowired
	BoardServiceTest boardService;
	
	@GetMapping("/review-insert")
	private String goBoardReview() {
		
		
		return "review-insert";
		

	}
	
	@PostMapping("/review-insert")
	private  String insertBoardReview(BoardReviewVO boardReviewVO) {
		
		boardService.insertBoardReviewService(boardReviewVO);

		return "my-page";
		
	}
	
	
	@GetMapping("/manager-page")
	private String goManagerPage() {
		
		return "manager-page";
		

	}
	
	@GetMapping("/manager-product")
	private String goManagerProduct() {
		
		return "manager-product";
		

	}
}
