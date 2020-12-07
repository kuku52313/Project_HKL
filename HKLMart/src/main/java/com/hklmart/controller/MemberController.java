package com.hklmart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hklmart.domain.MemberVO;
import com.hklmart.service.MemberService;

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
	
	@PostMapping("/loginFail")
	@ResponseBody
	public Map<String, Object> failLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> loginObj = new HashMap<>();
		loginObj.put("loginStatus", request.getAttribute("loginStatus"));
		loginObj.put("loginFailMsg", request.getAttribute("loginFailMsg"));
		 
		return loginObj;
	}

	
	@PostMapping("/loginSuccess")
	@ResponseBody
	public Map<String, Object> successLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> loginObj = new HashMap<>();
		loginObj.put("loginStatus", request.getAttribute("loginStatus"));
		
		return loginObj;
		 
		
	}
}
