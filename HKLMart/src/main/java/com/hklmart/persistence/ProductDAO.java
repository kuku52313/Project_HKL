package com.hklmart.persistence;

import com.hklmart.domain.*;

import java.util.List;

public interface ProductDAO {

    void saveFile(ProductVO productVO);

    void saveStock(StockVO stockVO);

    int codeCheck(String insertCode);

    void modifyFile(ProductVO productVO);

    void modifyStock(StockVO stockVO);

    List<ProductListMainDTO> getUserProductList(ProductPageCriteriaVO cri);

    List<ProductListMainDTO> getMainCategoryUserProductList(ProductPageCriteriaVO cri);

    ImageVO getImageInfo(String productCode);

    ProductVO getProductInfo(String productCode);

    List<ProductDetailVO> getProductDetail(String productCode);

}
