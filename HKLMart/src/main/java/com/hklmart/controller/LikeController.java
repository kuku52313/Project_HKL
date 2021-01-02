package com.hklmart.controller;

import com.hklmart.service.LikeService;
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

    public LikeController(LikeService like) {
        this.like = like;
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

    @PostMapping("/put")
    public void putProductLike(Principal principal, @RequestParam("productCode") String productCode) {
        like.putProductLike(principal.getName(), productCode);
    }

    @GetMapping("/take")
    public String takeProductLike(Principal principal, Model model) {
        model.addAttribute("likeList", like.likeList(principal.getName()));
        return "my-page";
    }
}

