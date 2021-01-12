package com.hklmart.persistence;
import com.hklmart.domain.ProductVO;

import java.util.List;

public interface SearchDAO {

    List<String> searchProduct(String searchStr);

    List<String> getProductCodeList(String keyword);

    ProductVO getProductList(String productCode);

}
