package com.hklmart.test;

import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class Tester {
	
	@Test
	public void test() {
		String uuid = UUID.randomUUID().toString();
		String uuid1 = UUID.randomUUID().toString();
		String uuid2 = UUID.randomUUID().toString();
		String uuid3 = UUID.randomUUID().toString();
		String uuid4 = UUID.randomUUID().toString();
		
		log.info("String uuid = " + uuid);
		log.info("String uuid1 = " + uuid1.toString());
		log.info("String uuid2 = " + uuid2.toString());
		log.info("String uuid3 = " + uuid3.toString());
		log.info("String uuid4 = " + uuid4.toString());
		
	}

}
