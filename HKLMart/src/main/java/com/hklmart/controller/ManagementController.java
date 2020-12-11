package com.hklmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/manager")
public class ManagementController {
	
	@GetMapping("/manager-page")
	private String goManagerPage() {
		
		return "manager-page";
		

	}
	
	@GetMapping("/manager-product")
	private String goManagerProduct() {
		
		return "manager-product";
		

	}
}
