package com.hklmart.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
	
	@RequestMapping("/")
	public String showIndex(Authentication authentication, Principal principal, Model model) {
		
		if(principal != null) {
			model.addAttribute("memberName", principal.getName());
		}
		
		return "index";
	}
	
	
	
}
