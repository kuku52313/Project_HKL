package com.hklmart.persistence;

import com.hklmart.domain.PageCriteriaVO;
import com.hklmart.domain.ProductVO;

import java.util.List;

public interface LikeDAO {

    void putProductLike(String memberId, String productCode);

    List<String> takeProductLike(String likeMemberId);

    int checkLike(String memberId, String productCode);

    void deleteLike(String memberId, String productCode);

    List<ProductVO> getUserLike(PageCriteriaVO cri, String memberId);

}
