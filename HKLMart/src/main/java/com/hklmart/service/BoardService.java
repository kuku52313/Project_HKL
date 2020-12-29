package com.hklmart.service;

import com.hklmart.domain.BoardAskVO;
import com.hklmart.domain.BoardReviewDTO;
import com.hklmart.domain.BoardReviewVO;
import com.hklmart.persistence.BoardDAO;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class BoardService {

    private final BoardDAO boardDAO;

    public BoardService(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }


    public void insertAskBoardService(BoardAskVO boardAskVO) {

        boardDAO.insertAskBoard(boardAskVO);
    }

    public void insertBoardReviewService(HttpServletRequest request, BoardReviewDTO boardReviewDTO) throws IllegalStateException, IOException {

        String fileName = UUID.randomUUID().toString() + "_" + boardReviewDTO.getUploadImg().getOriginalFilename();
        File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/reviewImg")));
        File contextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/reviewImg"));
        File image = new File(path + "\\" + fileName);
        File thumbnail = new File(path + "\\S_" + fileName);

        if (!image.exists()) {
            path.mkdirs();
            boardReviewDTO.getUploadImg().transferTo(image);
            Thumbnails.of(image).size(300, 300).outputFormat("png").toFile(thumbnail);
        }

        BoardReviewVO boardReviewVO = new BoardReviewVO();

        boardReviewVO.setBoardReviewNumber(boardReviewDTO.getBoardReviewNumber());
        boardReviewVO.setBoardReviewMemberId(boardReviewDTO.getBoardReviewMemberId());
        boardReviewVO.setBoardReviewProductCode(boardReviewDTO.getBoardReviewProductCode());
        boardReviewVO.setBoardReviewScore(boardReviewDTO.getBoardReviewScore());
        boardReviewVO.setBoardReviewContent(boardReviewDTO.getBoardReviewContent());
        boardReviewVO.setBoardReviewDate(boardReviewDTO.getBoardReviewDate());
        boardReviewVO.setBoardReviewImg(image.toString().replace(path.toString(), ""));
        boardReviewVO.setBoardReviewImgpath(contextPath.toString());
        boardReviewVO.setBoardReviewThumbnail(thumbnail.toString().replace(path.toString(), ""));

        boardDAO.insertBoardReview(boardReviewVO);

    }

    public String getFolderPath(String absolutePath) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String datePath = sdf.format(date).replace("-", File.separator);
        String path = absolutePath + "\\" + datePath;
        return path;
    }

    public void updateAskAnswer(BoardAskVO boardAskVO) {
        boardDAO.updateAskAnswer(boardAskVO);
    }


}
