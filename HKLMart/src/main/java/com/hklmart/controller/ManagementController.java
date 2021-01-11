package com.hklmart.controller;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.OrderPayVO;
import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.PageDTO;
import com.hklmart.service.ManagementService;
import com.hklmart.service.PageService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j
@Controller
@RequestMapping("/manager")
public class ManagementController {

    private final PageService pageService;
    private final ManagementService managementService;

    public ManagementController(PageService pageService, ManagementService managementService) {
        this.pageService = pageService;
        this.managementService = managementService;
    }

    @GetMapping("/manager-page")
    private String goManagerPage() {
        return "manager-page";
    }

    @GetMapping("/manager-product")
    public String goManagerProduct(Model model, PageCriteriaVO cri) {
        int total = pageService.getProductListTotal(cri);
        model.addAttribute("productList", managementService.getProductList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "manager-product";
    }

    @PostMapping("/manager-product-delete")
    public String deleteManagerProduct(@RequestParam("productCode") String productCode) {

        managementService.deleteManagerProduct(productCode);

        return "redirect:/manager/manager-product";
    }

    @GetMapping("/manager-ask-board")
    public String goManagerAskBoard(Model model, PageCriteriaVO cri) {

        model.addAttribute("AskBoardList", managementService.getAskBoardList(cri));

        int total = pageService.getAskBoardListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "manager-ask-board";
    }

    @GetMapping("/manager-ask-answer")
    public String goManagerAskAnawer(@RequestParam("boardAskNumber") String boardAskNumber, Model model) {
        model.addAttribute("answer", managementService.getAskAnswer(boardAskNumber));

        return "manager-ask-answer";
    }

    @PostMapping("/manager-ask-delete")
    public String deleteAskManager(@RequestParam("boardAskNumber") String boardAskNumber) {

        managementService.deleteAskManager(boardAskNumber);

        return "redirect:/manager/manager-ask-board";
    }

    @GetMapping("/manager-member-modify")
    public String goManageMember(@RequestParam("memberId") String memberId, Model model) {
        model.addAttribute("modify", managementService.getManageMember(memberId));

        return "manager-member-modify";
    }

    @PostMapping("/manager-member-delete")
    public String deleteMember(@RequestParam("memberId") String memberId) {

        managementService.deleteMember(memberId);

        return "redirect:/manager/manager-member-list";
    }

    @GetMapping("/manager-review-delete")
    public String goManagerReviewDelete(@RequestParam("boardReviewNumber") String boardReviewNumber) {

        managementService.deleteReviewManager(boardReviewNumber);

        return "redirect:/manager/manager-review-list";
    }

    @GetMapping("/manager-review-list")
    public String goManagerReviewList(Model model, PageCriteriaVO cri) {

        model.addAttribute("BoardReviewList", managementService.getBoardReviewList(cri));

        int total = pageService.getReviewListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));

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

        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "manager-member-list";
    }
    @GetMapping("/manager-order-list")
    public String goOrderList(Model model, PageCriteriaVO cri) {

        model.addAttribute("orderList",managementService.getOrderList(cri));

        int total = pageService.getOrderListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "manager-order-list";
    }
    @GetMapping("/manager-order-modify")
    public String getOrderModify(@RequestParam("orderNumber") String orderNumber, Model model){

        model.addAttribute("modify",managementService.getOrderModify(orderNumber));
        model.addAttribute("productList",managementService.getOrderProduct(orderNumber));

        log.info(managementService.getOrderProduct(orderNumber));

        return "manager-order-modify";
    }
    @PostMapping("/manager-order-modify-up")
    public String modifyOrder(OrderPayVO orderPayVO){

        managementService.modifyOrder(orderPayVO);

        return "redirect:/manager/manager-order-list";
    }
    @PostMapping("/ask-answer-up")
    public String askAnswerUp(BoardAskVO boardAskVO) {
        managementService.updateAskAnswer(boardAskVO);
        return "redirect:/manager/manager-ask-board";
    }
}
