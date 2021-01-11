package com.hklmart.persistence;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewVO;

public interface BoardDAO {

    void insertAskBoard(BoardAskVO boardAskVO);

    void insertBoardReview(BoardReviewVO boardReviewVO);



}
