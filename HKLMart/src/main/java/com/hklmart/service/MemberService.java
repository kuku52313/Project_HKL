package com.hklmart.service;

import com.hklmart.domain.MemberVO;
import com.hklmart.domain.UserDetailsVO;
import com.hklmart.persistence.MemberDAO;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Log4j
@Service
public class MemberService {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private MemberDAO memberDAO;

    public void registMember(MemberVO memberVO) {
        memberVO.setAuthoritiesMember("ROLE_MEMBER");
        memberVO.setAuthoritiesManager(null);
        memberVO.setAuthoritiesAdmin(null);
        memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
        memberDAO.registMember(memberVO);
        memberDAO.registAuthorities(memberVO);
    }

    public UserDetailsVO getMemberInfo(String memberId) {
        return memberDAO.getMemberInfo(memberId);
    }

    public void updatePassword(String memberId, String memberPw) {
        memberDAO.updatePassword(memberId, passwordEncoder.encode(memberPw));
    }


    public int idCheckTest(String userId) {
        return memberDAO.idDuplicatiedInspection(userId);
    }




}
