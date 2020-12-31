package com.hklmart.controller;

import com.hklmart.domain.PageDTO;
import com.hklmart.domain.ProductDetailVO;
import com.hklmart.domain.ProductPageCriteriaVO;
import com.hklmart.service.MemberService;
import com.hklmart.service.PageService;
import com.hklmart.service.ProductServiceImpl;
import com.hklmart.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {

    private final MemberService memberService;
    private final ProductServiceImpl productService;
    private final PageService pageService;
    private final SearchService searchService;

    public MainController(MemberService memberService, ProductServiceImpl productService, PageService pageService, SearchService searchService) {
        this.memberService = memberService;
        this.productService = productService;
        this.pageService = pageService;
        this.searchService = searchService;
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


        return "product-detail";
    }
}
