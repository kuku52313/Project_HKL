package com.hklmart.persistence;


import com.hklmart.domain.MemberVO;

public interface MemberDAO {

	public void registMember(MemberVO memberVO);
	
	public MemberVO getMemberInfo(String id);
	
}
