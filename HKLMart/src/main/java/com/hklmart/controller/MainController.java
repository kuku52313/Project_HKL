package com.hklmart.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/")
public class MainController {
	
	@GetMapping("/")
	public String showIndex(Principal principal, Model model) {
		
		// 메인페이지 로딩 시 권한 확인 
		// 권한 있을 시 유저 아이디 리턴
		if(principal != null) {
			model.addAttribute("memberName", principal.getName());
		}
		
		return "index";
	}
	
	
	
}
