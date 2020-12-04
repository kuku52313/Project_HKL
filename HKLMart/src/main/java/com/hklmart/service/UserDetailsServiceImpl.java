package com.hklmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.hklmart.persistence.MemberDAO;
import com.hklmart.repository.MemberVO;
import com.hklmart.repository.UserDetailsVO;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private MemberDAO mapper;

	@Override
	public UserDetails loadUserByUsername(String memberId) {

		UserDetailsVO userDetails = new UserDetailsVO();
		MemberVO member = mapper.getMemberInfo(memberId);

		if (member == null) {
			return null;

		} else {
			userDetails.setUsername(member.getMemberId());
			userDetails.setPassword(member.getMemberPw());
			userDetails.setAuthorities(member.getMemberAuthorities());
		}

		return userDetails;
	}
}