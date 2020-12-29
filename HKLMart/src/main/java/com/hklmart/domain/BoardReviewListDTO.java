package com.hklmart.domain;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class BoardReviewListDTO {

/*	@Autowired
	private WebApplicationContext ctx;*/

    //board_review 테이블과 product테이블 조인용 vo
    private String boardReviewNumber;
    private String productName;
    private String boardReviewMemberId;
    private String boardReviewProductCode;

    @Setter(AccessLevel.PROTECTED)
    private String boardReviewScore;
    private String boardReviewContent;
    private String boardReviewDate;

    @Setter(AccessLevel.PROTECTED)
    private String boardReviewImg;

    @Setter(AccessLevel.PROTECTED)
    private String boardReviewImgpath;
    
    @Setter(AccessLevel.PROTECTED)
    private String boardReviewThumbnail;

    protected void setboardReviewScore(String boardReviewScore) {
        if (Integer.parseInt(boardReviewScore) == 5) boardReviewScore = "완전 만족스러워요 (★★★★★)";
        else if (Integer.parseInt(boardReviewScore) == 4) boardReviewScore = "대체로 만족스러워요 (★★★★☆)";
        else if (Integer.parseInt(boardReviewScore) == 3) boardReviewScore = "보통이에요 (★★★☆☆)";
        else if (Integer.parseInt(boardReviewScore) == 2) boardReviewScore = "좀 아쉬워요 (★★☆☆☆)";
        else if (Integer.parseInt(boardReviewScore) == 1) boardReviewScore = "제품이 많이 아쉬워요 (★☆☆☆☆)";
        this.boardReviewScore = boardReviewScore;
    }

    protected void setBoardReviewImg(String boardReviewImg) {
        String pathReplace = boardReviewImg.replace('\\', '/');
        this.boardReviewImg = pathReplace;
    }

    protected void setBoardReviewImgpath(String boardReviewImgpath) {
        String pathReplace = boardReviewImgpath.replace('\\', '/');
        this.boardReviewImgpath = pathReplace;
    }

    protected void setBoardReviewThumbnail(String boardReviewThumbnail) {
        String pathReplace = boardReviewThumbnail.replace('\\', '/');
        this.boardReviewThumbnail = pathReplace;
    }

}
