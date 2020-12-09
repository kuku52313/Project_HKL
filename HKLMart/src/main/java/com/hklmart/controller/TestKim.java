package com.hklmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/testKim/*")
public class TestKim {

	
	@RequestMapping("/ask-board")
	public String goAskBoard() {
		
		
		return "ask-board";
	
	}
}
