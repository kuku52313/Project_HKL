package com.hklmart.service;
import com.hklmart.domain.BoardReviewListDTO;
import com.hklmart.domain.ProductDetailDTO;
import com.hklmart.domain.ProductListMainDTO;
import com.hklmart.domain.ProductPageCriteriaVO;
import com.hklmart.persistence.ProductDAO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductDAO productDAO;

    public ProductService(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    public List<ProductListMainDTO> getUserProductList(ProductPageCriteriaVO cri) {
        return productDAO.getUserProductList(cri);
    }

    public List<ProductListMainDTO> getMainCategoryUserProductList(ProductPageCriteriaVO cri) {
        return productDAO.getMainCategoryUserProductList(cri);
    }

    public int codeCheckTest(String insertCode) {
        return productDAO.codeCheck(insertCode);
    }

    public ProductDetailDTO getProductDetail(ProductPageCriteriaVO cri) {
        return productDAO.getProductDetail(cri);
    }

    public List<BoardReviewListDTO> getProductDetailReview(ProductPageCriteriaVO cri) {
        return productDAO.getProductDetailReview(cri);
    }

}

