package com.hklmart.controller;

import com.hklmart.domain.ProductModifyDTO;
import com.hklmart.domain.RegistProductVO;
import com.hklmart.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/product")
public class ProductController {

    private final FileService fileService;

    public ProductController(FileService fileService) {
        this.fileService = fileService;
    }

    @GetMapping("/product-regist")
    public String goProductRegist() {
        return "product-regist";
    }

    @PostMapping("/product-regist-up")
    public String registProduct(HttpServletRequest request, RegistProductVO productDTO) throws IllegalStateException, IOException {
        fileService.saveFile(request, productDTO);
        return "product-regist";
    }

    @PostMapping("/product-modify-up")
    public String modifyProduct(HttpServletRequest request, ProductModifyDTO productDTO) throws IllegalStateException, IOException {
        fileService.modifyProduct(request, productDTO);
        return "redirect:/manager/manager-product";
    }

}
