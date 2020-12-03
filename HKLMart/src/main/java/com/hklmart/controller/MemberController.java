package com.hklmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hklmart.repository.MemberVO;
import com.hklmart.service.MemberRegisterService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {
	
	@Autowired
	MemberRegisterService memberRegister;
	
	@GetMapping("/loginPage")
	public String tryLogin() {
		return "loginPage";
	}
	
	@PostMapping("/signup")
	public String doSignUp(MemberVO member) {
	
		member.setMemberAuthorities("ROLE_MEMBER");
		
		log.info("memberAuthorities = " + member.getMemberAuthorities());
		log.info("memberPw = " + member.getMemberPw());
		log.info("encMemberPw = " + memberRegister.doEncryption(member.getMemberPw()));
		
		return "redirect:/";
	}
	
}
