package com.hklmart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.domain.MemberVO;
import com.hklmart.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/loginPage")
	public String tryLogin() {
		return "loginPage";
	}
	
	@PostMapping("/signup")
	public String doSignUp(MemberVO memberVO) {
		memberService.registMember(memberVO);
		return "redirect:/";
	}
	
	@PostMapping("loginFail")
	public String failLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		model.addAttribute("loginFailMsg", request.getAttribute("loginFailMsg"));
		
		log.info("/loginFail Mapping");
		log.info("loginFailMsg = " + request.getAttribute("loginFailMsg"));
		 
		return "loginPage";
	}
	
}
