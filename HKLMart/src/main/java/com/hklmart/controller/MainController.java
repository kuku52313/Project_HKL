package com.hklmart.controller;
import com.hklmart.domain.PageDTO;
import com.hklmart.domain.ProductPageCriteriaVO;
import com.hklmart.service.MemberService;
import com.hklmart.service.PageService;
import com.hklmart.service.ProductService;
import com.hklmart.service.SearchService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Controller
public class MainController {

    private final MemberService memberService;
    private final ProductService productService;
    private final PageService pageService;
    private final SearchService searchService;

    public MainController(MemberService memberService, ProductService productService, PageService pageService, SearchService searchService) {
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
        Map<String, Object> map = new HashMap<>();
        map.put("cnt", memberService.idCheckTest(userId));
        return map;
    }

    @PostMapping("/codeCheck")
    @ResponseBody
    public Map<String, Object> codeCheck(@RequestBody String insertCode) {
        Map<String, Object> map = new HashMap<>();
        map.put("cnt", productService.codeCheckTest(insertCode));
        return map;
    }

    @GetMapping("/ajax/search")
    @ResponseBody
    public Map<String, Object> searchProduct(@RequestParam("searchStr") String searchStr) {
        Map<String, Object> map = new HashMap<>();
        map.put("searchList", searchService.searchProduct(searchStr));
        return map;
    }

    @GetMapping("/search")
    public String searchResult(@RequestParam("keyword") String keyword, Model model) {
        List<String> productCodeList = searchService.searchProductCodeList(keyword);
        model.addAttribute("searchList", searchService.getSearchProductVOList(productCodeList));
        return "search-page";
    }

    @GetMapping("/terms")
    public String termsPopup() {
        return "conditions";
    }

    @GetMapping("/product-list")
    public String goUserProductList(Model model, ProductPageCriteriaVO cri) {
        int total = pageService.getUserProductListTotal(cri);
        model.addAttribute("productList", productService.getUserProductList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "product-list";
    }

    @GetMapping("/product-list-MainCategory")
    public String goMainCategoryProduct(Model model, ProductPageCriteriaVO cri) {
        int total = pageService.getMainCategoryUserProductListTotal(cri);
        model.addAttribute("productList", productService.getMainCategoryUserProductList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "product-list";
    }

    @GetMapping("/product-detail")
    public String goProductDetailPage(Model model, ProductPageCriteriaVO cri) {
        int total = pageService.getReviewProductTotal(cri);
        model.addAttribute("infoShoes", productService.getProductDetail(cri));
        model.addAttribute("BoardReviewList", productService.getProductDetailReview(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("reviewTotal", total);
        return "product-detail";
    }

}
