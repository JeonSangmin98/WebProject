--------------------------------------------------------
--  파일이 생성됨 - 수요일-11월-30-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_REVIEW
--------------------------------------------------------

  CREATE TABLE "BOOK_PJ"."TBL_REVIEW" 
   (	"REVIEWNO" NUMBER(10,0), 
	"BNO" NUMBER(10,0), 
	"REVIEW" VARCHAR2(1000 BYTE), 
	"REVIEWER" VARCHAR2(50 BYTE), 
	"REVIEWDATE" DATE DEFAULT sysdate, 
	"UPDATEDATE" DATE DEFAULT sysdate -- 리뷰 수정
, 
	"RATING" NUMBER(2,1)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into BOOK_PJ.TBL_REVIEW
SET DEFINE OFF;
Insert into BOOK_PJ.TBL_REVIEW (REVIEWNO,BNO,REVIEW,REVIEWER,REVIEWDATE,UPDATEDATE,RATING) values (56,1,'test','test',to_date('22/11/30','RR/MM/DD'),to_date('22/11/30','RR/MM/DD'),5);
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_PJ"."PK_REVIEW" ON "BOOK_PJ"."TBL_REVIEW" ("REVIEWNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_REVIEW
--------------------------------------------------------

  ALTER TABLE "BOOK_PJ"."TBL_REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("REVIEWNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_PJ"."TBL_REVIEW" MODIFY ("REVIEWER" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_REVIEW" MODIFY ("REVIEW" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_REVIEW" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_REVIEW
--------------------------------------------------------

  ALTER TABLE "BOOK_PJ"."TBL_REVIEW" ADD CONSTRAINT "FK_REVIEW" FOREIGN KEY ("BNO")
	  REFERENCES "BOOK_PJ"."TBL_BOOK" ("BNO") ENABLE;
