package com.hklmart.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hklmart.domain.RegistProductDTO;
import com.hklmart.service.FileService;
import com.hklmart.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/product-regist")
	public String goProductRegist() {
		return "product-regist";
	}

	@PostMapping("/product-regist-up")
	public String registProduct(HttpServletRequest request, RegistProductDTO productDTO) {
		String path = fileService.getFolderPath(request.getSession()
				.getServletContext()
				.getRealPath("/resources/product"));
		
		log.info("path = " + path);
		
		File upload = new File(path);
		
		log.info("upload = " + upload);
		
		if(!upload.exists()) {
			upload.mkdirs();
			log.info("폴더생성");
		}
		
		return "product-regist";
	}
}
