create SEQUENCE seq_review;
create table tbl_review(
    reviewNo number(10,0),   -- 리뷰 번호    
    bno number(10,0) not null,  --게시글 번호    
    review varchar2(1000) not null,  -- 리뷰 내용
    reviewer varchar2(50) not null,  -- 리뷰 작성자   
    reviewDate date default sysdate, -- 리뷰 작성일   
    updateDate date default sysdate -- 리뷰 수정
);
-- rating(별점)추가 
alter table tbl_review add (rating number(2,1));
-- pk
alter table tbl_review add constraint pk_review primary key(reviewNo);
-- fk
alter table tbl_review add constraint fk_review foreign key(bno) references tbl_book(bno);

-- tbl_book에 reviewCnt 추가  
alter table tbl_book add (reviewCnt number default 0);
-- 기존의 리뷰    reviewCnt에 반영  
update tbl_book set reviewCnt = (select count(reviewNo) from tbl_review where tbl_review.boardNo = tbl_book.bno);