package com.hklmart.service;

import com.hklmart.domain.UserDetailsVO;
import com.hklmart.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private MemberDAO mapper;

    @Override
    public UserDetails loadUserByUsername(String memberId) {
        UserDetailsVO userDetails = mapper.getMemberInfo(memberId);
        if (userDetails == null) return null;
        else {
            userDetails.setUsername(userDetails.getMemberId());
            userDetails.setPassword(userDetails.getMemberPw());
            userDetails.setAuthorities(userDetails.getAuthoritiesMember(), userDetails.getAuthoritiesManager(), userDetails.getAuthoritiesAdmin());
        }
        return userDetails;
    }
}