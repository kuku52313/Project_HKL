package com.hklmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String showIndex() {
		return "index";
	}
	
	@GetMapping("test")
	public String goProductRegist() {
		return "product-regist";
	}
	
	
	
}
