package com.hklmart.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.repository.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/loginPage")
	public String tryLogin() {
		return "loginPage";
	}
	
	@PostMapping("/signup")
	public String doSignUp(BCryptPasswordEncoder passwordEncoder, MemberVO memberVO) {
	
		memberVO.setMemberAuthorities("ROLE_MEMBER");
		memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		
		log.info("memberPw = " + memberVO.getMemberPw());
		
		return "redirect:/";
	}
	
}
