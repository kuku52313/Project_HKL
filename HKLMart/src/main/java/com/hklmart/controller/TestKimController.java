package com.hklmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.service.ManagementService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/testKim")
public class TestKimController {
	
	@Autowired
	ManagementService managementService;
	
	

}
