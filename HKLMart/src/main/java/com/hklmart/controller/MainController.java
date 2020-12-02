package com.hklmart.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
public class MainController {
	
	UserDetails userDetails;

	@GetMapping("/index")
	public String showIndex(Authentication authentication, Model model) {
		
		if(authentication != null) {
			userDetails = (UserDetails) authentication.getPrincipal();
			log.info(userDetails.getUsername());
			model.addAttribute("memberName", userDetails.getUsername());
		}
		
		return "index";
	}

	@GetMapping("/test")
	public String doTest() {
		return "index";
	}

	@PostMapping("/login")
	public String doLogin() {
		return "index";
	}

	@GetMapping("/loginPage")
	public String tryLogin() {
		return "loginPage";
	}

	@GetMapping("/productList")
	public String goproductList() {
		return "/productList";
	}
}
