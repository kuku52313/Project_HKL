package com.hklmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	@PostMapping("/login")
	public String doLogin() {
		return "redirect:/";
	}
	
	@PostMapping("/logout")
	public String doLogout() {
		return "redirect:/";
	}

	@GetMapping("/loginPage")
	public String tryLogin() {
		return "loginPage";
	}
	
}
