package com.hklmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.repository.MemberVO;
import com.hklmart.service.MemberRegistService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberRegistService memberService;
	
	@GetMapping("/loginPage")
	public String tryLogin() {
		return "loginPage";
	}
	
	@PostMapping("/signup")
	public String doSignUp(MemberVO memberVO) {
		
		memberService.registMember(memberVO);
		
		return "redirect:/";
	}
	
}
