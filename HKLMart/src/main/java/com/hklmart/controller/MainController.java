package com.hklmart.controller;

import com.hklmart.service.MemberService;
import com.hklmart.service.ProductServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {

    private final MemberService memberService;
    private final ProductServiceImpl productService;

    public MainController(MemberService memberService, ProductServiceImpl productService) {
        this.memberService = memberService;
        this.productService = productService;
    }

    @RequestMapping("/")
    public String showIndex() {
        return "index";
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public Map<String, Object> idCheck(@RequestBody String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cnt", memberService.idCheckTest(userId));
        return map;
    }

    @PostMapping("/codeCheck")
    @ResponseBody
    public Map<String, Object> codeCheck(@RequestBody String insertCode) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cnt", productService.codeCheckTest(insertCode));
        return map;
    }

    @RequestMapping("/user-review-list")
    public String goAskReview() {
        return "user-review-list";
    }

    @GetMapping("/product-list")
    public String goManagerProduct() {
        return "product-list";
    }

    @GetMapping("/admin/product-list")
    public String goAdmin() {
        return "product-list";
    }

}
