package com.hklmart.repository;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberAuthorities;
}
