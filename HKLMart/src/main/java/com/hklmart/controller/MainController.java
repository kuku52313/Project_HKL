package com.hklmart.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hklmart.service.MemberService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping("/")
	public String showIndex() {
		return "index";
	}
	
	
	
	//login
	@PostMapping("/idCheck")
	@ResponseBody
	public Map<String, Object> idcheck(@RequestBody String userId) {
	        
	
	        int count = 0;
	        Map<String, Object> map = new HashMap<String, Object>();   
	        count = memberService.idCheckTest(userId);
	        map.put("cnt", count);
	 
	        return map;
	}
	
	
}
