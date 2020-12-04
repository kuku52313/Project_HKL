package com.hklmart.persistence;


import com.hklmart.repository.MemberVO;

public interface MemberDAO {

	public void registMember(MemberVO memberVO);
	
	public MemberVO getMemberInfo(String id);
	
}
