package com.hklmart.persistence;


import com.hklmart.domain.MemberVO;
import com.hklmart.domain.UserDetailsVO;
import org.apache.ibatis.annotations.Insert;

public interface MemberDAO {
	
	void registMember(MemberVO memberVO);
	
	void registAuthorities(MemberVO memberVO);
	
	UserDetailsVO getMemberInfo(String memberId);
	
	@Insert("UPDATE MEMBER SET MEMBER_PW = #{param2} WHERE MEMBER_ID = #{param1}")
    void updatePassword(String memberId, String memberPw);
	
	int idDuplicatiedInspection(String userId);

	
	
}
