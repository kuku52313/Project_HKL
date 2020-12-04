--------------------------------------------------------
--  DDL for Table BASKET
--------------------------------------------------------

  CREATE TABLE "HKL"."BASKET" 
   (	"BASKET_MEMBER_ID" CHAR(15 BYTE), 
	"BASKET_PRODUCT_CODE" CHAR(6 BYTE)
   );
--------------------------------------------------------
--  DDL for Table BOARD_ASK
--------------------------------------------------------

  CREATE TABLE "HKL"."BOARD_ASK" 
   (	"BOARD_ASK_NUMBER" NUMBER, 
	"BOARD_ASK_MEMBER_ID" CHAR(15 BYTE), 
	"BOARD_ASK_DATE" DATE, 
	"BOARD_ASK_CONTENT" VARCHAR2(3000 BYTE), 
	"BOARD_ASK_TITLE" VARCHAR2(200 BYTE), 
	"BOARD_ASK_STATE" CHAR(10 BYTE) DEFAULT '접수', 
	"BOARD_ASK_KIND" CHAR(10 BYTE)
   );
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT
--------------------------------------------------------

  CREATE TABLE "HKL"."BOARD_COMMENT" 
   (	"BOARD_COMMENT_BOARD_REVIEW_NUMBER" NUMBER, 
	"BOARD_COMMENT_NUMBER" VARCHAR2(20 BYTE), 
	"BOARD_COMMENT_CONTENT" VARCHAR2(3000 BYTE), 
	"BOARD_COMMENT_MEMBER_ID" CHAR(15 BYTE)
   );
--------------------------------------------------------
--  DDL for Table BOARD_REVIEW
--------------------------------------------------------

  CREATE TABLE "HKL"."BOARD_REVIEW" 
   (	"BOARD_REVIEW_NUMBER" NUMBER, 
	"BOARD_REVIEW_MEMBER_ID" CHAR(15 BYTE), 
	"BOARD_REVIEW_PRODUCT_CODE" CHAR(6 BYTE), 
	"BOARD_REVIEW_TITLE" VARCHAR2(100 BYTE), 
	"BOARD_REVIEW_CONTENT" VARCHAR2(3000 BYTE)
   );
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "HKL"."MEMBER" 
   (	"MEMBER_ID" CHAR(15 BYTE), 
	"MEMBER_PW" CHAR(60 BYTE), 
	"MEMBER_NAME" CHAR(10 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(40 BYTE), 
	"MEMBER_TEL" CHAR(15 BYTE), 
	"MEMBER_AUTHORITIES" CHAR(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT" 
   (	"PRODUCT_NAME" VARCHAR2(100 BYTE), 
	"PRODUCT_CODE" CHAR(6 BYTE), 
	"PRODUCT_BRAND" CHAR(15 BYTE), 
	"PRODUCT_PRICE" NUMBER(8,0),
 	"PRODUCT_KIND" NUMBER(4,0)
   );
--------------------------------------------------------
--  DDL for Table PRODUCT_LIKE
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT_LIKE" 
   (	"PRODUCT_LIKE_MEMBER_ID" CHAR(15 BYTE), 
	"PRODUCT_LIKE_PRODUCT_CODE" CHAR(6 BYTE)
   );
--------------------------------------------------------
--  DDL for Table PRODUCT_ORDER
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT_ORDER" 
   (	"ORDER_NUMBER" NUMBER, 
	"ORDER_MEMBER_ID" CHAR(15 BYTE), 
	"ORDER_PRODUCT_CODE" CHAR(6 BYTE), 
	"ORDER_DATE" DATE, 
    	"ORDER_ADDRESS" varchar2(100 byte),
	"ORDER_STATE" VARCHAR2(20 BYTE) DEFAULT '준비 중 입니다'
	    
   );
--------------------------------------------------------
--  DDL for Table PRODUCT_STOCK
--------------------------------------------------------

  CREATE TABLE "HKL"."PRODUCT_STOCK" 
   (	"STOCK_PRODUCT_CODE" CHAR(6 BYTE), 
	"STOCK_240" VARCHAR2(20 BYTE), 
	"STOCK_250" VARCHAR2(20 BYTE), 
	"STOCK_260" VARCHAR2(20 BYTE), 
	"STOCK_270" VARCHAR2(20 BYTE), 
	"STOCK_280" VARCHAR2(20 BYTE), 
	"STOCK_290" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Index BOARD_ASK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."BOARD_ASK_PK" ON "HKL"."BOARD_ASK" ("BOARD_ASK_NUMBER");
--------------------------------------------------------
--  DDL for Index BOARD_COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."BOARD_COMMENT_PK" ON "HKL"."BOARD_COMMENT" ("BOARD_COMMENT_NUMBER");
--------------------------------------------------------
--  DDL for Index BOARD_REVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."BOARD_REVIEW_PK" ON "HKL"."BOARD_REVIEW" ("BOARD_REVIEW_NUMBER");
--------------------------------------------------------
--  DDL for Index MEMBER_PK_MEMBER_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."MEMBER_PK_MEMBER_ID" ON "HKL"."MEMBER" ("MEMBER_ID");
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."PRODUCT_PK" ON "HKL"."PRODUCT" ("PRODUCT_CODE");
--------------------------------------------------------
--  DDL for Index PRODUCT_ORDER_PK_ORDER_NUMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "HKL"."PRODUCT_ORDER_PK_ORDER_NUMBER" ON "HKL"."PRODUCT_ORDER" ("ORDER_NUMBER");
--------------------------------------------------------
--  Constraints for Table BASKET
--------------------------------------------------------

  ALTER TABLE "HKL"."BASKET" MODIFY ("BASKET_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BASKET" MODIFY ("BASKET_PRODUCT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_ASK
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_DATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_TITLE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_STATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" MODIFY ("BOARD_ASK_KIND" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_ASK" ADD CONSTRAINT "BOARD_ASK_PK" PRIMARY KEY ("BOARD_ASK_NUMBER");
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_BOARD_REVIEW_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_PK" PRIMARY KEY ("BOARD_COMMENT_NUMBER");
--------------------------------------------------------
--  Constraints for Table BOARD_REVIEW
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_TITLE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" MODIFY ("BOARD_REVIEW_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."BOARD_REVIEW" ADD CONSTRAINT "BOARD_REVIEW_PK" PRIMARY KEY ("BOARD_REVIEW_NUMBER");
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_PW" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_TEL" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" MODIFY ("MEMBER_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "HKL"."MEMBER" ADD CONSTRAINT "MEMBER_PK_MEMBER_ID" PRIMARY KEY ("MEMBER_ID");
  ALTER TABLE "HKL"."MEMBER" ADD CONSTRAINT "MEMBER_CK_MEMBER_EMAIL" CHECK (member_email like '%@%.%') ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_BRAND" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" MODIFY ("PRODUCT_PRICE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT" ADD CONSTRAINT "PRODUCT_PK_PRODUCT_CODE" PRIMARY KEY ("PRODUCT_CODE");
--------------------------------------------------------
--  Constraints for Table PRODUCT_LIKE
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_LIKE" MODIFY ("PRODUCT_LIKE_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_LIKE" MODIFY ("PRODUCT_LIKE_PRODUCT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_ORDER
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" ADD CONSTRAINT "PRODUCT_ORDER_PK_ORDER_NUMBER" PRIMARY KEY ("ORDER_NUMBER");
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_DATE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "HKL"."PRODUCT_ORDER" MODIFY ("ORDER_ADDRESS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_STOCK
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_STOCK" MODIFY ("STOCK_PRODUCT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BASKET
--------------------------------------------------------

  ALTER TABLE "HKL"."BASKET" ADD CONSTRAINT "BASKET_FK_MEMBER_ID" FOREIGN KEY ("BASKET_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HKL"."BASKET" ADD CONSTRAINT "BASKET_FK_PRODUCT_CODE" FOREIGN KEY ("BASKET_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_ASK
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_ASK" ADD CONSTRAINT "BOARD_ASK_FK_MEMBER_ID" FOREIGN KEY ("BOARD_ASK_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_FK_BOARD_REVIEW_NUMBER" FOREIGN KEY ("BOARD_COMMENT_BOARD_REVIEW_NUMBER")
	  REFERENCES "HKL"."BOARD_REVIEW" ("BOARD_REVIEW_NUMBER") ENABLE;
  ALTER TABLE "HKL"."BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_FK_MEMBER_ID" FOREIGN KEY ("BOARD_COMMENT_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_REVIEW
--------------------------------------------------------

  ALTER TABLE "HKL"."BOARD_REVIEW" ADD CONSTRAINT "BOARD_REVIEW_FK_PRODUCT_CODE" FOREIGN KEY ("BOARD_REVIEW_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ENABLE;
  ALTER TABLE "HKL"."BOARD_REVIEW" ADD CONSTRAINT "BOARD_REVIEW_FK_MEMBER_ID" FOREIGN KEY ("BOARD_REVIEW_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_LIKE
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_LIKE" ADD CONSTRAINT "PRODUCT_LIKE_FK_PRODUCT_CODE" FOREIGN KEY ("PRODUCT_LIKE_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HKL"."PRODUCT_LIKE" ADD CONSTRAINT "PRODUCT_LIKE_FK_MEMBER_ID" FOREIGN KEY ("PRODUCT_LIKE_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_ORDER
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_ORDER" ADD CONSTRAINT "PRODUCT_ORDER_FK_PRODUCT_CODE" FOREIGN KEY ("ORDER_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ENABLE;
  ALTER TABLE "HKL"."PRODUCT_ORDER" ADD CONSTRAINT "PRODUCT_ORDER_FK_MEMBER_ID" FOREIGN KEY ("ORDER_MEMBER_ID")
	  REFERENCES "HKL"."MEMBER" ("MEMBER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_STOCK
--------------------------------------------------------

  ALTER TABLE "HKL"."PRODUCT_STOCK" ADD CONSTRAINT "PRODUCT_STOCK_FK_STOCK_PRODUCT_CODE" FOREIGN KEY ("STOCK_PRODUCT_CODE")
	  REFERENCES "HKL"."PRODUCT" ("PRODUCT_CODE") ENABLE;
