package com.hklmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberRegisterServiceImpl implements MemberRegisterService{
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String doEncryption(String password) {
		
		return passwordEncoder.encode(password);
	}
	
}
