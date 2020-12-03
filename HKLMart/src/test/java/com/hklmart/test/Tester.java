package com.hklmart.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class Tester {
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Test
	public void showRegister() {
		
		String pw = "1234";
		
		log.info(bCryptPasswordEncoder.encode(pw));
	}
	
	
}
