package com.hklmart.domain;

import lombok.Data;

@Data
public class BoardReviewListVO {
	//board_review 테이블과 product테이블 조인용 vo
	private String boardReviewNumber;
	private String productName;	
	private String boardReviewMemberId;
	private String boardReviewProductCode;
	private String boardReviewScore;
	private String boardReviewContent;	
	private String boardReviewDate;
}
