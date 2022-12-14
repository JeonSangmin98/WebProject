--------------------------------------------------------
--  파일이 생성됨 - 수요일-11월-30-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_REPLY
--------------------------------------------------------

  CREATE TABLE "BOOK_PJ"."TBL_REPLY" 
   (	"REPLYNO" NUMBER(10,0), 
	"BOARDNO" NUMBER(10,0), 
	"REPLY" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REPLYDATE" DATE DEFAULT sysdate, 
	"UPDATEDATE" DATE DEFAULT sysdate -- 수정일  

   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into BOOK_PJ.TBL_REPLY
SET DEFINE OFF;
Insert into BOOK_PJ.TBL_REPLY (REPLYNO,BOARDNO,REPLY,REPLYER,REPLYDATE,UPDATEDATE) values (24,41,'t','t',to_date('22/11/20','RR/MM/DD'),to_date('22/11/20','RR/MM/DD'));
Insert into BOOK_PJ.TBL_REPLY (REPLYNO,BOARDNO,REPLY,REPLYER,REPLYDATE,UPDATEDATE) values (26,25,'test','tester',to_date('22/11/23','RR/MM/DD'),to_date('22/11/23','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index PK_TBL_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_PJ"."PK_TBL_REPLY" ON "BOOK_PJ"."TBL_REPLY" ("REPLYNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_REPLY
--------------------------------------------------------

  CREATE INDEX "BOOK_PJ"."IDX_REPLY" ON "BOOK_PJ"."TBL_REPLY" ("BOARDNO" DESC, "REPLYNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "BOOK_PJ"."TBL_REPLY" ADD CONSTRAINT "PK_TBL_REPLY" PRIMARY KEY ("REPLYNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_PJ"."TBL_REPLY" MODIFY ("REPLYER" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_REPLY" MODIFY ("REPLY" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_REPLY" MODIFY ("BOARDNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "BOOK_PJ"."TBL_REPLY" ADD CONSTRAINT "FK_REPLY_BOARD" FOREIGN KEY ("BOARDNO")
	  REFERENCES "BOOK_PJ"."TBL_BOARD" ("BOARDNO") ENABLE;
