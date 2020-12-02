package com.hklmart.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/access")
public class ExceptionController {
	
	@GetMapping("/accessException")
	public String handlingException(Authentication auth, Model model) {
		
		model.addAttribute("message", "접근 권한이 없습니다");
		
		return "accessException";
	}

}
