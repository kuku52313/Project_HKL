package com.hklmart.controller;

import org.springframework.web.bind.annotation.PostMapping;

public class TestController {
	
	@PostMapping("/test")
	public String doTest() {
		return "TestPageName";
	}
}
