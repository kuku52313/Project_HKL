package com.hklmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hklmart.persistence.MemberDAO;
import com.hklmart.repository.MemberVO;

import lombok.extern.log4j.Log4j;

@Service
public class MemberRegistService{
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberDAO memberDAO;

	public void registMember(MemberVO memberVO) {
		memberVO.setMemberAuthorities("ROLE_MEMBER");
		memberVO.setMemberEmail(passwordEncoder.encode(memberVO.getMemberEmail()));
		memberDAO.registMember(memberVO);
	}
	
}
