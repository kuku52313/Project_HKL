package com.hklmart.controller;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.PageDTO;
import com.hklmart.service.LikeService;
import com.hklmart.service.PageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/like")
public class LikeController {
    private final LikeService like;
    private final PageService pageService;

    public LikeController(LikeService like, PageService pageService) {
        this.like = like;
        this.pageService = pageService;
    }

    @GetMapping("/check")
    @ResponseBody
    public Map<String, Object> checkLike(Principal principal, @RequestParam("productCode") String productCode) {
        int count = like.checkLike(principal.getName(), productCode);
        if (count == 0) {
            like.putProductLike(principal.getName(), productCode);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("result", count);
        return map;
    }
    @GetMapping("/delete")
    public void deleteLike(Principal principal, @RequestParam("productCode") String productCode) {
        like.deleteLike(principal.getName(),productCode);
    }

    @PostMapping("/put")
    public void putProductLike(Principal principal, @RequestParam("productCode") String productCode) {
        like.putProductLike(principal.getName(), productCode);
    }

    @GetMapping("/take")
    public String takeProductLike(Principal principal, Model model) {
        model.addAttribute("likeList", like.likeList(principal.getName()));
        return "my-page";
    }

    @GetMapping("/get")
    public String getUserLike(PageCriteriaVO cri, Principal principal, Model model) {

        model.addAttribute("likeList", like.getUserLike(cri, principal.getName()));

        int total = pageService.getLikeListTotal(cri, principal.getName());

        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "like-page";
    }
}