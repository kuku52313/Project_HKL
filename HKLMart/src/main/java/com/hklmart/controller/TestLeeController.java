package com.hklmart.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@Controller
@RequestMapping("/testLee/*")
public class TestLeeController {
	
	
	@GetMapping("/product-detail")
	public String goProductDetail() {
		return "product-detail";
	}
	
	@GetMapping("order")
	public String goOrder() {
		return "/order";
	}

	@GetMapping("/management-member-list")
	public String goManageMemberList() { return "manager-member-modify";}

	@GetMapping("/basket")
	public String goBasket() {
		return "basket"; }
}
