create table tbl_book (
    bno number(20, 0), --책 번호 seq 사용
    author varchar2(100), --저자
    title varchar2(200), --제목
    discount number(20, 0), --가격
    pubdate date, --책 출판일 
    isbn number(20, 0), --책 고유번호
    image varchar2(300), -- 책 이미지
    category varchar2(20), --카테고리
    publisher varchar2(100), --책 출판사
    description varchar2(4000) --책 상세정보
);
create SEQUENCE seq_book;
alter table tbl_book add constraint pk_book primary key(bno);

alter table tbl_book add ratingAvg number(2,1);     -- 별점 평균 추가  