package com.hklmart.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hklmart.service.MemberService;

@Controller
public class MainController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/")
	public String showIndex() {
		return "index";
	}

	@PostMapping("/idCheck")
	@ResponseBody
	public Map<String, Object> idcheck(@RequestBody String userId) {
		int count = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		count = memberService.idCheckTest(userId);
		map.put("cnt", count);
		return map;
	}

	@GetMapping("test")
	public String goProductRegist() {
		return "product-regist";
	}

}
