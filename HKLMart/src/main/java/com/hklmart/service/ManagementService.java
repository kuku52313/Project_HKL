package com.hklmart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hklmart.domain.ProductListDTO;
import com.hklmart.persistence.ManagementDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ManagementService {

	@Autowired
	ManagementDAO managmentDAO;
	
	public List<ProductListDTO> getProductList() {
		
		return managmentDAO.getProductList();
	}
	
	
}
