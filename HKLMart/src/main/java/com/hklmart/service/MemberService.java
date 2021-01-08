package com.hklmart.service;

import com.hklmart.domain.*;
import com.hklmart.persistence.MemberDAO;
import lombok.extern.log4j.Log4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class MemberService {

    private final BCryptPasswordEncoder passwordEncoder;
    private final MemberDAO memberDAO;

    public MemberService(BCryptPasswordEncoder passwordEncoder, MemberDAO memberDAO) {
        this.passwordEncoder = passwordEncoder;
        this.memberDAO = memberDAO;
    }

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
    public List<BoardAskDTO> getUserAskList(ProductPageCriteriaVO cri) {

        return memberDAO.getUserAskList(cri);
    }
    public List<BoardReviewListDTO> getUserReviewList(ProductPageCriteriaVO cri) {
        return memberDAO.getUserReviewList(cri);
    }


    public void updateMemberAddress(MemberAddressVO memberAddressVO) {
        memberDAO.updateMemberAddress(memberAddressVO);
    }

    public List<orderProductListDTO> getUserOrderList(ProductPageCriteriaVO cri) {

        return memberDAO.getUserOrderList(cri);
    }

    public OrderViewVO getOrderDetail(String orderNumber) {
        return memberDAO.getOrderDetail(orderNumber);
    }

    public List<orderProductListDTO> getOrderDetailProduct(String orderNumber) {

        return memberDAO.getOrderDetailProduct(orderNumber);
    }

    public void deleteReviewUser(String boardReviewNumber) {
        memberDAO.deleteReviewUser(boardReviewNumber);
    }
}
