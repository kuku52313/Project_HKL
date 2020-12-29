package com.hklmart.service;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductListDTO;
import com.hklmart.domain.ProductListMainDTO;
import com.hklmart.domain.ProductPageCriteriaVO;
import com.hklmart.persistence.ProductDAO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductDAO productDAO;

    public ProductServiceImpl(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Override
    public void registProduct() {
    }

    @Override
    public void deleteProduct() {
    }

    public List<ProductListMainDTO> getUserProductList(ProductPageCriteriaVO cri) {
        return productDAO.getUserProductList(cri);
    }

    public int codeCheckTest(String insertCode) {
        return productDAO.codeCheck(insertCode);
    }
}
