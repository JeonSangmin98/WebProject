--------------------------------------------------------
--  파일이 생성됨 - 화요일-11월-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_CART
--------------------------------------------------------

  CREATE TABLE "BOOK_PJ"."TBL_CART" 
   (	"CARTBNO" NUMBER(20,0), 
	"BNO" NUMBER(20,0), 
	"TITLE" VARCHAR2(200 BYTE), 
	"PRICE" NUMBER(20,0), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"IMAGE" VARCHAR2(300 BYTE), 
	"CARTCOUNT" NUMBER(10,0), 
	"TOTALPRICE" NUMBER(20,0), 
	"MEMBERID" VARCHAR2(50 BYTE), 
	"BOOKCOUNT" NUMBER(10,0), 
	"DISCOUNT" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into BOOK_PJ.TBL_CART
SET DEFINE OFF;
Insert into BOOK_PJ.TBL_CART (CARTBNO,BNO,TITLE,PRICE,CATEGORY,IMAGE,CARTCOUNT,TOTALPRICE,MEMBERID,BOOKCOUNT,DISCOUNT) values (49,2,'교토 갈까?',18000,'여행','https://shopping-phinf.pstatic.net/main_3537185/35371854681.20221027194508.jpg',3,18000,'gwanung',10,10);
Insert into BOOK_PJ.TBL_CART (CARTBNO,BNO,TITLE,PRICE,CATEGORY,IMAGE,CARTCOUNT,TOTALPRICE,MEMBERID,BOOKCOUNT,DISCOUNT) values (48,7,'나의 문화유산답사기 11 : 서울편 3',19800,'역사','https://shopping-phinf.pstatic.net/main_3536755/35367558621.20221027194716.jpg',5,19800,'test2',10,10);
--------------------------------------------------------
--  DDL for Index SYS_C007605
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_PJ"."SYS_C007605" ON "BOOK_PJ"."TBL_CART" ("CARTBNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007608
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_PJ"."SYS_C007608" ON "BOOK_PJ"."TBL_CART" ("MEMBERID", "BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_CART
--------------------------------------------------------

  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("DISCOUNT" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("BOOKCOUNT" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" ADD UNIQUE ("MEMBERID", "BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_PJ"."TBL_CART" ADD PRIMARY KEY ("CARTBNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("MEMBERID" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("TOTALPRICE" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("IMAGE" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "BOOK_PJ"."TBL_CART" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_CART
--------------------------------------------------------

  ALTER TABLE "BOOK_PJ"."TBL_CART" ADD CONSTRAINT "FK_CART_BOOK" FOREIGN KEY ("BNO")
	  REFERENCES "BOOK_PJ"."TBL_BOOK" ("BNO") ENABLE;
  ALTER TABLE "BOOK_PJ"."TBL_CART" ADD CONSTRAINT "FK_CART_MEMBER" FOREIGN KEY ("MEMBERID")
	  REFERENCES "BOOK_PJ"."TBL_MEMBER" ("MEMBERID") ENABLE;
