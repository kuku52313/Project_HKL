
--------------------------------------------------------
--  오라클 12c 계정 설정을 위한 세션 변경 
--------------------------------------------------------
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--------------------------------------------------------
--  hkl 계정 및 모든 테이블 삭제
--------------------------------------------------------
DROP USER hkl CASCADE;

--------------------------------------------------------
--  hkl 계정 생성
--------------------------------------------------------
CREATE USER hkl IDENTIFIED BY root;

--------------------------------------------------------
--  hkl 계정에 DBA 권한 부여
--------------------------------------------------------
GRANT DBA TO hkl;

--------------------------------------------------------
--  파일이 생성됨 - 월요일-12월-14-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AUTHORITIES
--------------------------------------------------------

  CREATE TABLE "HKL"."AUTHORITIES" 
   (	"AUTHORITIES_MEMBER_ID" VARCHAR2(15 BYTE), 
	"AUTHORITIES_MEMBER" VARCHAR2(20 BYTE), 
	"AUTHORITIES_MANAGER" VARCHAR2(20 BYTE), 
	"AUTHORITIES_ADMIN" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "HKL"."MEMBER" 
   (	"MEMBER_ID" VARCHAR2(15 BYTE), 
	"MEMBER_PW" CHAR(60 BYTE), 
	"MEMBER_NAME" VARCHAR2(15 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(40 BYTE), 
	"MEMBER_TEL" CHAR(11 BYTE), 
	"MEMBER_REGDATE" DATE DEFAULT sysdate, 
	"MEMBER_ADDRESS" VARCHAR2(150 BYTE) DEFAULT '주소를 입력하여 주세요'
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT_LIKE
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT_LIKE" 
   (	"LIKE_MEMBER_ID" VARCHAR2(15 BYTE), 
	"LIKE_PRODUCT_CODE" CHAR(6 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BASKET
--------------------------------------------------------

  CREATE TABLE "HKL"."BASKET" 
   (	"BASKET_MEMBER_ID" VARCHAR2(15 BYTE), 
	"BASKET_PRODUCT_CODE" CHAR(6 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT
--------------------------------------------------------

  CREATE TABLE "HKL"."BOARD_COMMENT" 
   (	"BOARD_COMMENT_BOARD_REVIEW_NUMBER" NUMBER, 
	"BOARD_COMMENT_CONTENT" VARCHAR2(3000 BYTE), 
	"BOARD_COMMENT__MEMBER_ID" VARCHAR2(15 BYTE), 
	"BOARD_COMMENT__REGDATE" DATE DEFAULT sysdate
   ) ;
--------------------------------------------------------
--  DDL for Table STOCK
--------------------------------------------------------

  CREATE TABLE "HKL"."STOCK" 
   (	"STOCK_PRODUCT_CODE" CHAR(6 BYTE), 
	"STOCK_290" NUMBER DEFAULT 0, 
	"STOCK_295" NUMBER, 
	"STOCK_240" NUMBER, 
	"STOCK_245" NUMBER DEFAULT 0, 
	"STOCK_250" NUMBER, 
	"STOCK_255" NUMBER, 
	"STOCK_260" NUMBER, 
	"STOCK_265" NUMBER, 
	"STOCK_270" NUMBER, 
	"STOCK_275" NUMBER, 
	"STOCK_280" NUMBER, 
	"STOCK_285" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_ASK
--------------------------------------------------------

  CREATE TABLE "HKL"."BOARD_ASK" 
   (	"BOARD_ASK_NUMBER" NUMBER, 
	"BOARD_ASK_MEMBER_ID" VARCHAR2(15 BYTE), 
	"BOARD_ASK_DATE" DATE DEFAULT sysdate, 
	"BOARD_ASK_TITLE" VARCHAR2(200 BYTE), 
	"BOARD_ASK_CONTENT" VARCHAR2(3000 BYTE), 
	"BOARD_ASK_STATE" VARCHAR2(30 BYTE) DEFAULT '접수 완료', 
	"BOARD_ASK_TYPE" NUMBER(1,0), 
	"BOARD_ASK_PRODUCT" CHAR(6 BYTE) DEFAULT 000000, 
	"BOARD_ASK_ORDER_NUMBER" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_REVIEW
--------------------------------------------------------

  CREATE TABLE "HKL"."BOARD_REVIEW" 
   (	"BOARD_REVIEW_NUMBER" NUMBER, 
	"BOARD_REVIEW_MEMBER_ID" VARCHAR2(15 BYTE), 
	"BOARD_REVIEW_PRODUCT_CODE" CHAR(6 BYTE), 
	"BOARD_REVIEW_SCORE" NUMBER(1,0), 
	"BOARD_REVIEW_CONTENT" VARCHAR2(3000 BYTE), 
	"BOARD_REVIEW_DATE" DATE DEFAULT sysdate
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT_ORDER_LIST
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT_ORDER_LIST" 
   (	"ORDER_LIST_ORDER_NUMBER" NUMBER, 
	"ORDER_LIST_PRODUCT" CHAR(6 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT_ORDER
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT_ORDER" 
   (	"ORDER_NUMBER" NUMBER, 
	"ORDER_MEMBER_ID" VARCHAR2(15 BYTE), 
	"ORDER_PRODUCT" CHAR(6 BYTE), 
	"ORDER_DATE" DATE DEFAULT sysdate, 
	"ORDER_ADDRESS" VARCHAR2(150 BYTE), 
	"ORDER_STATE" VARCHAR2(60 BYTE) DEFAULT '주문 접수 처리중', 
	"ORDER_NAME" VARCHAR2(15 BYTE), 
	"ORDER_MEMO" VARCHAR2(60 BYTE), 
	"ORDER_TEL" CHAR(11 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT" 
   (	"PRODUCT_CODE" CHAR(6 BYTE), 
	"PRODUCT_NAME" VARCHAR2(100 BYTE), 
	"PRODUCT_BRAND" VARCHAR2(45 BYTE), 
	"PRODUCT_PRICE" NUMBER(8,0), 
	"PRODUCT_TYPE" NUMBER(4,0), 
	"PRODUCT_IMGPATH" VARCHAR2(200 BYTE), 
	"PRODUCT_IMG" VARCHAR2(100 BYTE), 
	"PRODUCT_THUMBNAIL" VARCHAR2(100 BYTE)
   ) ;
REM INSERTING into HKL.AUTHORITIES
SET DEFINE OFF;
Insert into HKL.AUTHORITIES (AUTHORITIES_MEMBER_ID,AUTHORITIES_MEMBER,AUTHORITIES_MANAGER,AUTHORITIES_ADMIN) values ('kuku52313','ROLE_MEMBER','ROLE_MANAGER','ROLE_ADMIN');
Insert into HKL.AUTHORITIES (AUTHORITIES_MEMBER_ID,AUTHORITIES_MEMBER,AUTHORITIES_MANAGER,AUTHORITIES_ADMIN) values ('lee123','ROLE_MEMBER','ROLE_MANAGER','ROLE_ADMIN');
Insert into HKL.AUTHORITIES (AUTHORITIES_MEMBER_ID,AUTHORITIES_MEMBER,AUTHORITIES_MANAGER,AUTHORITIES_ADMIN) values ('hch4102','ROLE_MEMBER','ROLE_MANAGER','ROLE_ADMIN');
REM INSERTING into HKL.MEMBER
SET DEFINE OFF;
Insert into HKL.MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_EMAIL,MEMBER_TEL,MEMBER_REGDATE,MEMBER_ADDRESS) values ('kuku52313','$2a$10$BM7FI3Xq6TwEmARKLSt84eKG8UTj3eQEFZdNkDM5j6qW3TwhNADTC','김희곤','lars523@naver.com','01099961644',to_date('20/12/14','RR/MM/DD'),null);
Insert into HKL.MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_EMAIL,MEMBER_TEL,MEMBER_REGDATE,MEMBER_ADDRESS) values ('lee123','$2a$10$PQTmslxqg1FmhzOafPIwa.U9AcnWeyhhdeu7bQpCw.V1kiVQnG4xK','이예린','sasdfa@naver.com','01088888888',to_date('20/12/14','RR/MM/DD'),null);
Insert into HKL.MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_EMAIL,MEMBER_TEL,MEMBER_REGDATE,MEMBER_ADDRESS) values ('hch4102','$2a$10$.mjOnnsEtUM73wjmMg7nPeq/ze76Emx3WNYqvEUVlxxOXDRqqrHJG','한창훈','hch4102@naver.com','01051249231',to_date('20/12/14','RR/MM/DD'),null);
REM INSERTING into HKL.PRODUCT_LIKE
SET DEFINE OFF;
REM INSERTING into HKL.BASKET
SET DEFINE OFF;
REM INSERTING into HKL.BOARD_COMMENT
SET DEFINE OFF;
REM INSERTING into HKL.STOCK
SET DEFINE OFF;
REM INSERTING into HKL.BOARD_ASK
SET DEFINE OFF;
REM INSERTING into HKL.BOARD_REVIEW
SET DEFINE OFF;
REM INSERTING into HKL.PRODUCT_ORDER_LIST
SET DEFINE OFF;
REM INSERTING into HKL.PRODUCT_ORDER
SET DEFINE OFF;
REM INSERTING into HKL.PRODUCT
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."MEMBER_PK" ON "HKL"."MEMBER" ("MEMBER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_ASK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."BOARD_ASK_PK" ON "HKL"."BOARD_ASK" ("BOARD_ASK_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_REVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."BOARD_REVIEW_PK" ON "HKL"."BOARD_REVIEW" ("BOARD_REVIEW_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index PRODUCT_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."PRODUCT_ORDER_PK" ON "HKL"."PRODUCT_ORDER" ("ORDER_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."PRODUCT_PK" ON "HKL"."PRODUCT" ("PRODUCT_CODE") 
  ;
--------------------------------------------------------
--  Constraints for Table AUTHORITIES
--------------------------------------------------------

  ALTER TABLE "HKL"."AUTHORITIES" MODIFY ("AUTHORITIES_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."AUTHORITIES" MODIFY ("AUTHORITIES_MEMBER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_PW" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_TEL" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_REGDATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("MEMBER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT_LIKE
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_LIKE" MODIFY ("LIKE_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_LIKE" MODIFY ("LIKE_PRODUCT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BASKET
--------------------------------------------------------

  ALTER TABLE "HKL"."BASKET" MODIFY ("BASKET_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BASKET" MODIFY ("BASKET_PRODUCT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_BOARD_REVIEW_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT__MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT__REGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STOCK
--------------------------------------------------------

  ALTER TABLE "HKL"."STOCK" MODIFY ("STOCK_PRODUCT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_ASK
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_DATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_TITLE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_STATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" ADD CONSTRAINT "BOARD_ASK_PK" PRIMARY KEY ("BOARD_ASK_NUMBER")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_REVIEW
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_SCORE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" ADD CONSTRAINT "BOARD_REVIEW_PK" PRIMARY KEY ("BOARD_REVIEW_NUMBER")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT_ORDER
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_DATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_NAME" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_TEL" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" ADD CONSTRAINT "PRODUCT_ORDER_PK" PRIMARY KEY ("ORDER_NUMBER")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_BRAND" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_PRICE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" ADD CONSTRAINT "PRODUCT_PK" PRIMARY KEY ("PRODUCT_CODE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTHORITIES
--------------------------------------------------------

  ALTER TABLE "HKL"."AUTHORITIES" ADD CONSTRAINT "AUTHOLITIES_MEMBER_ID_FK_MEMBER_ID" FOREIGN KEY ("AUTHORITIES_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_LIKE
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_LIKE" ADD CONSTRAINT "PRODUCT_LIKE_FK_PRODUCT_CODE" FOREIGN KEY ("LIKE_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HKL"."PRODUCT_LIKE" ADD CONSTRAINT "PRODUCT_LIKE_FK_MEMBER_ID" FOREIGN KEY ("LIKE_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BASKET
--------------------------------------------------------

  ALTER TABLE "HKL"."BASKET" ADD CONSTRAINT "BASKET_FK_PRODUCT_CODE" FOREIGN KEY ("BASKET_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HKL"."BASKET" ADD CONSTRAINT "BASKET_FK_MEMBER_ID" FOREIGN KEY ("BASKET_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_FK_BOARD_REVIEW_NUMBER" FOREIGN KEY ("BOARD_COMMENT_BOARD_REVIEW_NUMBER")
	  REFERENCES "HKL"."BOARD_REVIEW" ("BOARD_REVIEW_NUMBER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STOCK
--------------------------------------------------------

  ALTER TABLE "HKL"."STOCK" ADD CONSTRAINT "STOCK_PRODUCT_CODE_FK_PRODUCT_CODE" FOREIGN KEY ("STOCK_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_ASK
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_ASK" ADD CONSTRAINT "BOARD_ASK_FK_MEMBER_ID" FOREIGN KEY ("BOARD_ASK_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_REVIEW
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_REVIEW" ADD CONSTRAINT "BOARD_REVIEW_FK_PRODUCT_CODE" FOREIGN KEY ("BOARD_REVIEW_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HKL"."BOARD_REVIEW" ADD CONSTRAINT "BOARD_REVIEW_FK_MEMBER_ID" FOREIGN KEY ("BOARD_REVIEW_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_ORDER_LIST
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_ORDER_LIST" ADD CONSTRAINT "PRODUCT_ORDER_LIST_FK_ORDER_NUMBER" FOREIGN KEY ("ORDER_LIST_ORDER_NUMBER")
	  REFERENCES "HKL"."PRODUCT_ORDER" ("ORDER_NUMBER") ENABLE;
  ALTER TABLE "HKL"."PRODUCT_ORDER_LIST" ADD CONSTRAINT "PRODUCT_ORDER_LIST_FK1" FOREIGN KEY ("ORDER_LIST_PRODUCT")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_ORDER
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_ORDER" ADD CONSTRAINT "PRODUCT_ORDER_PRODUCT_CODE_FK_PRODUCT_CODE" FOREIGN KEY ("ORDER_PRODUCT")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ENABLE;
  ALTER TABLE "HKL"."PRODUCT_ORDER" ADD CONSTRAINT "PRODUCT_ORDER_MEMBER_ID_FK_MEMBER_ID" FOREIGN KEY ("ORDER_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ENABLE;

--------------------------------------------------------
--  create SEQUENCE
--------------------------------------------------------

create SEQUENCE seq_board_ask;
create SEQUENCE seq_board_review;
create SEQUENCE seq_order_number;
