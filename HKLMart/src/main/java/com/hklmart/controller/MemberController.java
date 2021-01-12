package com.hklmart.controller;
import com.hklmart.domain.*;
import com.hklmart.service.MemberService;
import com.hklmart.service.PageService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

    private final PageService pageService;
    private final MemberService memberService;

    public MemberController(MemberService memberService, PageService pageService) {
        this.memberService = memberService;
        this.pageService = pageService;
    }

    @RequestMapping("/login-page")
    public String tryLogin(Authentication authentication) {
        if (authentication == null) { return "login-page"; }
        else { return "redirect:/"; }
    }

    @PostMapping("/signup")
    public String doSignUp(MemberVO memberVO) {
        memberService.registMember(memberVO);
        return "redirect:/";
    }

    @PostMapping("/login-fail")
    @ResponseBody
    public Map<String, Object> failLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> loginObj = new HashMap<>();
        loginObj.put("loginStatus", request.getAttribute("loginStatus"));
        loginObj.put("loginFailMsg", request.getAttribute("loginFailMsg"));
        return loginObj;
    }

    @PostMapping("/login-success")
    @ResponseBody
    public Map<String, Object> successLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> loginObj = new HashMap<>();
        loginObj.put("loginStatus", request.getAttribute("loginStatus"));
        return loginObj;
    }

    @GetMapping("/my-page")
    public String goMyPage() {
        return "forward:/basket/take";
    }

    @PostMapping("/update")
    public String passwordUpdate(Principal principal, @RequestParam("memberPw") String memberPw) {
        System.out.println("principal.getName() = " + principal.getName());
        memberService.updatePassword(principal.getName(), memberPw);
        return "my-page";
    }

    @GetMapping("/my-page-ask-board")
    public String goMyAskBoard() {
        return "ask-board";
    }

    @GetMapping("/user-review-list")
    public String goUserAskReviewList(ProductPageCriteriaVO cri, Model model, Principal principal) {
        cri.setMemberId(principal.getName());
        model.addAttribute("BoardReviewList", memberService.getUserReviewList(cri));
        int ReviewTotal = pageService.getUserReviewListTotal(cri);
        model.addAttribute("PageMaker", new PageDTO(cri, ReviewTotal));
        return "user-review-list";
    }

    @GetMapping("/user-ask-list")
    public String goUserAskList(ProductPageCriteriaVO cri, Model model, Principal principal) {
        cri.setMemberId(principal.getName());
        model.addAttribute("AskBoardList", memberService.getUserAskList(cri));
        int askTotal = pageService.getUserAskListTotal(cri);
        model.addAttribute("PageMaker", new PageDTO(cri, askTotal));
        return "user-ask-list";
    }

    @GetMapping("/updateAddress")
    @ResponseBody
    public Map<String, Object> updateMemberAddress(Principal principal, MemberAddressVO memberAddressVO) {
        memberAddressVO.setMemberId(principal.getName());
        memberService.updateMemberAddress(memberAddressVO);
        Map<String, Object> map = new HashMap<>();
        map.put("message", 1);
        return map;
    }

    @GetMapping("/user-order-list")
    public String getUserOrderList(Principal principal, ProductPageCriteriaVO cri, Model model) {
        cri.setMemberId(principal.getName());
        model.addAttribute("orderProductList", memberService.getUserOrderList(cri));
        int total = pageService.getUserOrderListTotal(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "/user-order-list";
    }

    @GetMapping("/user-order-detail")
    public String getOrderDetail(@RequestParam("orderNumber") String orderNumber, Model model, Principal principal) {
        model.addAttribute("orderList", memberService.getOrderDetail(orderNumber));
        model.addAttribute("productList", memberService.getOrderDetailProduct(orderNumber));
        return "user-order-detail";
    }

    @GetMapping("/user-review-delete")
    public String goManagerReviewDelete(@RequestParam("boardReviewNumber") String boardReviewNumber) {
        memberService.deleteReviewUser(boardReviewNumber);
        return "redirect:/member/user-review-list?pageNum=1&amount=10";
    }

    @GetMapping("/user-ask-view")
    public String goManagerAskAnawer(@RequestParam("boardAskNumber") String boardAskNumber, Model model) {
        model.addAttribute("answer", memberService.getAskAnswer(boardAskNumber));
        return "user-ask-view";
    }

}
