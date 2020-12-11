package com.hklmart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hklmart.domain.ProductVO;
import com.hklmart.persistence.ManagementDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ManagementService {

	@Autowired
	ManagementDAO managmentDAO;
	
	public List<ProductVO> getProductList() {
		// TODO Auto-generated method stub
		log.info("");
		return managmentDAO.getProductList();
	}
	
	
}
