package com.hklmart.controller;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewDTO;
import com.hklmart.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/ask-board")
    public String goAskBoard() {
        return "ask-board";
    }

    @PostMapping("/ask-board")
    public String insertAskBoard(BoardAskVO boardAskVO) {
        boardService.insertAskBoardService(boardAskVO);
        return "redirect:/member/my-page";
    }

    @GetMapping("/review-insert")
    public String goBoardReview() {
        return "review-insert";
    }

    @PostMapping("/review-insert")
    public String insertBoardReview(HttpServletRequest request, BoardReviewDTO boardReviewDTO) throws IllegalStateException, IOException {

        boardService.insertBoardReviewService(request, boardReviewDTO);
        return "redirect:/member/my-page";
    }


}
