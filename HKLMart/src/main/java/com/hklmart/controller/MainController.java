package com.hklmart.controller;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.PageDTO;
import com.hklmart.service.MemberService;
import com.hklmart.service.PageService;
import com.hklmart.service.ProductService;
import com.hklmart.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    PageService pageService;

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

   /* @GetMapping("/product-list")
    public String goManagerProduct() {
        return "product-list";
    }*/

    @GetMapping("/product-list")
    public String goManagerProduct(Model model, PageCriteriaVO cri) {

        model.addAttribute("product",  productService.getUserProductList(cri));

        int total = pageService.getProductListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "product-list";
    }

    @GetMapping("/admin/product-list")
    public String goAdmin() {
        return "product-list";
    }

}
