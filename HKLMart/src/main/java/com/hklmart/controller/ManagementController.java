package com.hklmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.service.ManagementService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/manager")
public class ManagementController {
	
	@Autowired
	ManagementService managementService;
	
	@GetMapping("/manager-page")
	private String goManagerPage() {
		
		return "manager-page";
		
	}
	
	
	@GetMapping("/manager-product")
	public String goManagerProduct(Model model) {
		
		model.addAttribute("productList", managementService.getProductList());
		
		return "manager-product";
	}
	
	@GetMapping("/manager-ask-board")
	public String goManagerAskBoard(Model model) {
		
		model.addAttribute("AskBoardList", managementService.getAskBoardList());
		
		return "manager-ask-board";
	}

	
	@GetMapping("/manager-review-list")
	public String goManagerReviewList(Model model) {
		
		model.addAttribute("BoardReviewList", managementService.getBoardReviewList());
		
		return "manager-review-list";
	}
	
	
}
