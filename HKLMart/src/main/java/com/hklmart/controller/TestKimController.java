package com.hklmart.controller;

import com.hklmart.service.ManagementService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j
@Controller
@RequestMapping("/testKim")
public class TestKimController {

    @Autowired
    ManagementService managementService;


    @GetMapping("/manager-ask-answer")
    public String goManagerAskAnawer(@RequestParam("boardAskNumber") String boardAskNumber, Model model) {
        model.addAttribute("answer", managementService.getAskAnswer(boardAskNumber));
        return "manager-ask-answer";
    }


}
