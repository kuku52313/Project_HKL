package com.hklmart.persistence;
import com.hklmart.domain.StockVO;

public interface StockDAO {

    StockVO getStock(String productCode);

}
