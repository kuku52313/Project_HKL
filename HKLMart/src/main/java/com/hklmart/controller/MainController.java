package com.hklmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
	
	@GetMapping("/index")
	public String showIndex() {
		
		return "index";
	}
	
	@GetMapping("/test")
	public String doTest() {
		
		return "index";
	}
	
	@GetMapping("/login")
	public String goLoginPage1() {
		
		return "/login";
	}
	
	@PostMapping("/login")
	public String goLoginPage2() {
		
		return "/login";
	}
	@GetMapping("/productList")
	public String goproductList() {
		
		return "/productList";
	}
}