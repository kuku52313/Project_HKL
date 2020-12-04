package com.hklmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hklmart.repository.MemberVO;
import com.hklmart.repository.UserDetailsVO;

@Service
public class LoginAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	UserDetailsService userDetailsServcie;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String inputId = authentication.getName();
		String inputPw = (String) authentication.getCredentials();

		UserDetailsVO userDetails = (UserDetailsVO) userDetailsServcie.loadUserByUsername(inputId);
		
		// 아이디와 비밀번호가 일치하지않을 경우
		// DB에 정보가 없는 경우
		if (userDetails == null || !inputId.equals(userDetails.getName()) || !passwordEncoder.matches(inputPw, userDetails.getPassword()))
			throw new BadCredentialsException(inputId);
		
		// 잠긴 계정일 경우
		else if (!userDetails.isAccountNonLocked())
			throw new LockedException(inputId);

		// 비활성화된 계정일 경우
		else if (!userDetails.isEnabled())
			throw new DisabledException(inputId);

		// 만료된 계정일 경우
		else if (!userDetails.isAccountNonExpired())
			throw new AccountExpiredException(inputId);

		// 비밀번호가 만료된 경우
		else if (!userDetails.isCredentialsNonExpired())
			throw new CredentialsExpiredException(inputId);

		userDetails.setPassword(null);

		Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());

		return auth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
