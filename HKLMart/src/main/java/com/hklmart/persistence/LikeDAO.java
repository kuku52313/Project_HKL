package com.hklmart.persistence;

import java.util.List;

public interface LikeDAO {

    void putProductLike(String memberId, String productCode);

    List<String> takeProductLike(String likeMemberId);

    int checkLike(String memberId, String productCode);

}
