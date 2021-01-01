package com.hklmart.controller;

import com.hklmart.domain.PageDTO;
import com.hklmart.domain.ProductPageCriteriaVO;
import com.hklmart.service.MemberService;
import com.hklmart.service.PageService;
import com.hklmart.service.ProductServiceImpl;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@Controller
@RequestMapping("/testKim")
public class TestKimController {

    @Autowired
    public PageService pageService;

    @Autowired
    public MemberService memberService;


    @PostMapping("/user-ask-review-list")
    public String goUserAskReviewList(ProductPageCriteriaVO cri,Model model){
        log.info("맵핑 성공~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+cri);
        model.addAttribute("AskBoardList", memberService.getUserAskList(cri));

        int askTotal = pageService.getUserAskListTotal(cri);

        model.addAttribute("AskPageMaker", new PageDTO(cri, askTotal));
        int pageNum = cri.getPageNum();
        model.addAttribute("AskPageNum", pageNum);
        log.info("문의 맵핑 성공~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+new PageDTO(cri, askTotal));
        cri.setPageNum(cri.getPageNumReview());

        model.addAttribute("BoardReviewList", memberService.getUserReviewList(cri));

        int ReviewTotal = pageService.getUserReviewListTotal(cri);

        model.addAttribute("ReviewPageMaker", new PageDTO(cri, ReviewTotal));
        log.info("ReviewPageMaker"+new PageDTO(cri, askTotal));
        return "user-ask-review-list";
    }


}
