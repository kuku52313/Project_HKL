package com.hklmart.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class TestController {
	
	@GetMapping("/test")
	public String doTest() {
		return "TestPageName";
	}
}
