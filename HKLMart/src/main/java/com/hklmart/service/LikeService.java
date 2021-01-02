package com.hklmart.service;

import com.hklmart.domain.ProductVO;
import com.hklmart.persistence.LikeDAO;
import com.hklmart.persistence.ProductDAO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LikeService {
    private final LikeDAO like;
    private final ProductDAO product;

    public LikeService(LikeDAO like, ProductDAO product) {
        this.like = like;
        this.product = product;
    }

    public void putProductLike(String memberId, String productCode) {
        like.putProductLike(memberId, productCode);
    }

    public List<String> takeProductLike(String memberId) {
        return like.takeProductLike(memberId);
    }

    public int checkLike(String memberId, String productCode) {
        return like.checkLike(memberId, productCode);
    }

    public List<ProductVO> likeList(String memberId) {
        List<String> codeList = like.takeProductLike(memberId);
        List<ProductVO> productList = new ArrayList<>();
        for (String code : codeList) {
            productList.add(product.getProductInfo(code));
        }
        return productList;
    }
}
