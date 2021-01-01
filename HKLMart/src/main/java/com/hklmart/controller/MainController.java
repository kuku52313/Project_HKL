package com.hklmart.controller;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.PageDTO;
import com.hklmart.domain.ProductPageCriteriaVO;
import com.hklmart.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.Clock;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {

    private final MemberService memberService;
    private final ProductServiceImpl productService;
    private final PageService pageService;
    private final SearchService searchService;
    private final ManagementService managementService;

    public MainController(MemberService memberService, ProductServiceImpl productService, PageService pageService, SearchService searchService, ManagementService managementService) {
        this.memberService = memberService;
        this.productService = productService;
        this.pageService = pageService;
        this.searchService = searchService;
        this.managementService = managementService;
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

    @GetMapping("/ajax/search")
    @ResponseBody
    public Map<String, Object> searchProduct(@RequestParam("searchStr") String searchStr) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchList", searchService.searchProduct(searchStr));
        return map;
    }

   /* @GetMapping("/product-list")
    public String goManagerProduct() {
        return "product-list";
    }*/


  /*  @GetMapping("/admin/product-list")
    public String goAdmin() {
        return "product-list";
    }*/

    @GetMapping("/product-list")
    public String goUserProductList(Model model, ProductPageCriteriaVO cri) {

        model.addAttribute("productList", productService.getUserProductList(cri));


        int total = pageService.getUserProductListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "product-list";
    }


    @GetMapping("/product-list-MainCategory")
    public String goMainCategoryProduct(Model model, ProductPageCriteriaVO cri) {

        model.addAttribute("productList", productService.getMainCategoryUserProductList(cri));

        int total = pageService.getMainCategoryUserProductListTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "product-list";
    }
    @GetMapping("/product-detail")
    public String goProductDetail(@RequestParam("productCode") String productCode,Model model) {


        model.addAttribute("infoShoes", productService.getProductDetail(productCode));
        System.out.println("11111111111111111111111111111111111111111");
        PageCriteriaVO cri = new PageCriteriaVO();
        cri.setPageNum(1);
        cri.setAmount(5);
        System.out.println(cri);
        model.addAttribute("BoardReviewList", productService.getProductDetailReview(cri,productCode));
        System.out.println("3333333333333333333333333333333333333333");
        int total = pageService.getReviewProductTotal(cri,productCode);
        System.out.println("444444444444444444444444444444444444444");
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        System.out.println("5555555555555555555555555555555555");
        model.addAttribute("reviewTotal",total);
        System.out.println("6666666666666666666666666666666666666");

        return "product-detail";
    }
}
