package com.hklmart.service;
import com.hklmart.domain.BoardReviewVO;
import com.hklmart.persistence.BoardDAO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceTest {

    private final BoardDAO boardDAO;

    public BoardServiceTest(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    public void insertBoardReviewService(BoardReviewVO boardReviewVO) {
        boardDAO.insertBoardReview(boardReviewVO);
    }

}
