package com.hklmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewVO;
import com.hklmart.service.BoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/ask-board")
	public String goAskBoard() {
		
		return "ask-board";
	
	}
	
	@PostMapping("/ask-board")
	public String insertAskBoard(BoardAskVO boardAskVO) {
		
		log.info(boardAskVO);
		
		boardService.insertAskBoardService(boardAskVO);
		
		return "my-page";
	}
	
	
	
	
	@GetMapping("/review-insert")
	public String goBoardReview() {
		
		
		return "review-insert";
		

	}
	
	@PostMapping("/review-insert")
	public  String insertBoardReview(BoardReviewVO boardReviewVO) {
		
		boardService.insertBoardReviewService(boardReviewVO);

		return "my-page";
		
	}
	
}
