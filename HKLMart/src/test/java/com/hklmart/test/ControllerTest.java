package com.hklmart.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ControllerTest {
	
	@Autowired
	private WebApplicationContext was;
	
	private MockMvc mockMvc;

	@Before
	public void init() {
		mockMvc = MockMvcBuilders.webAppContextSetup(was).build();
		log.info("Controller Test init.......");
	}
	
	@Test
	public void test() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.post("/product/product-regist-up"));
	}
	

}
