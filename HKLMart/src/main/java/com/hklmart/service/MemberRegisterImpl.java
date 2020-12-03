package com.hklmart.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberRegisterImpl implements MemberRegister{
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public String doEncryption(String password) {
		
		return bCryptPasswordEncoder.encode(password);
	}
	
}
