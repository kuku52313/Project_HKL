package com.hklmart.controller;

import com.hklmart.domain.MemberVO;
import com.hklmart.service.MemberService;
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

    private MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @RequestMapping("/login-page")
    public String tryLogin(Authentication authentication) {
        if (authentication == null)
            return "login-page";
        else
            return "redirect:/";
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
        memberService.updatePassword(principal.getName(), memberPw);
        return "my-page";
    }

    @GetMapping("/my-page-ask-board")
    public String goMyAskBoard() {
        return "ask-board";
    }

}
