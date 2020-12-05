package com.hklmart.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String handlingException(Exception ex, Model model) {
	
		model.addAttribute("message", ex.getClass());
		
		return "exception";
	}

}
