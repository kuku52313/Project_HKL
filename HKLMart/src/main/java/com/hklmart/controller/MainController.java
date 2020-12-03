package com.hklmart.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	UserDetails userDetails;

	@GetMapping("/")
	public String showIndex(Authentication authentication, Model model) {
		
		// 메인페이지 로딩 시 권한 확인 
		// 권한 있을 시 유저 아이디 리턴
		if(authentication != null) {
			userDetails = (UserDetails) authentication.getPrincipal();
			model.addAttribute("memberName", userDetails.getUsername());
		}
		
		return "index";
	}

}
