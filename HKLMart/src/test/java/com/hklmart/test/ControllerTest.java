package com.hklmart.test;

import com.hklmart.controller.BasketController;
import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ControllerTest {

    @Autowired
    private BasketController controller;

    MockMvc mockMvc;

    @Before
    public void init() {
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
        log.info("Controller Test init.......");
    }

    @Test
    public void test() throws Exception {
        mockMvc.perform(get("/basket/put")
                .param("memberId", "hch4102")
                .param("productCode", "A00001"))
                .andExpect(status().isOk());
    }
}
