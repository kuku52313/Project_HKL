package com.hklmart.persistence;

import com.hklmart.domain.*;

import java.util.List;

public interface ProductDAO {

    void saveFile(ProductVO productVO);

    void saveStock(StockVO stockVO);

    int codeCheck(String insertCode);

    void modifyFile(ProductVO productVO);

    void modifyStock(StockVO stockVO);

    List<ProductListDTO> getUserProductList(PageCriteriaVO cri,String productType);

    ImageVO getImageInfo(String productCode);

}
