package com.hklmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewVO;
import com.hklmart.persistence.BoardDAO;

@Service
public class BoardService {

    @Autowired
    BoardDAO boardDAO;


    public void insertAskBoardService(BoardAskVO boardAskVO) {

        boardDAO.insertAskBoard(boardAskVO);
    }

    public void insertBoardReviewService(BoardReviewVO boardReviewVO) {

        boardDAO.insertBoardReview(boardReviewVO);

    }
}
