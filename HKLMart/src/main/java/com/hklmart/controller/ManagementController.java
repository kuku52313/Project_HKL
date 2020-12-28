package com.hklmart.controller;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.PageDTO;
import com.hklmart.service.ManagementService;
import com.hklmart.service.PageService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j
@Controller
@RequestMapping("/manager")
public class ManagementController {


    @Autowired
    PageService pageService;

    @Autowired
    ManagementService managementService;

    @GetMapping("/manager-page")
    private String goManagerPage() {
        return "manager-page";
    }

    @GetMapping("/manager-product")
    public String goManagerProduct(Model model) {
        model.addAttribute("productList", managementService.getProductList());
        return "manager-product";
    }

    @GetMapping("/manager-ask-board")
    public String goManagerAskBoard(Model model, PageCriteriaVO cri) {

        model.addAttribute("AskBoardList", managementService.getAskBoardList(cri));

        int total = pageService.getAskBoardListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri,total));
        return "manager-ask-board";
    }

    @GetMapping("/manager-ask-answer")
    public String goManagerAskAnawer(@RequestParam("boardAskNumber") String boardAskNumber, Model model) {
        model.addAttribute("answer", managementService.getAskAnswer(boardAskNumber));


        return "manager-ask-answer";
    }


    @GetMapping("/manager-review-list")
    public String goManagerReviewList(Model model) {
        model.addAttribute("BoardReviewList", managementService.getBoardReviewList());
        return "manager-review-list";
    }

    @GetMapping("/product-modify")
    public String goProductModify(@RequestParam("productCode") String productCode, Model model) {
        model.addAttribute("product", managementService.getModify(productCode));
        return "product-modify";
    }

    @GetMapping("/manager-member-list")
    public String goMemberList(Model model, PageCriteriaVO cri) {

        model.addAttribute("MemberList", managementService.getMemberList(cri));

        int total = pageService.getMemberListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri,total));
        return "manager-member-list";
    }
}
