package com.hklmart.persistence;


import com.hklmart.domain.*;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface MemberDAO {

    void registMember(MemberVO memberVO);

    void registAuthorities(MemberVO memberVO);

    UserDetailsVO getMemberInfo(String memberId);

    @Insert("UPDATE MEMBER SET MEMBER_PW = #{param2} WHERE MEMBER_ID = #{param1}")
    void updatePassword(String memberId, String memberPw);

    int idDuplicatiedInspection(String userId);

    List<BoardAskDTO> getUserAskList(ProductPageCriteriaVO cri);

    List<BoardReviewListDTO> getUserReviewList(ProductPageCriteriaVO cri);



}
