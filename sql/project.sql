create sequence seq_book_board;

create table book_board(
    bno number(10,0),   --게시글 번호    
    title varchar2(200) not null,   -- 게시글 제목   
    content varchar2(2000) not null,    -- 게시글 내용
    writer varchar2(50) not null,   -- 게시글 작성자
    regdate date default sysdate,   -- 게시글 작성일
    updatedate date default sysdate
);

alter table book_board add constraint pk_book_board primary key(bno);

insert into book_board (bno,title,content,writer) values(seq_book_board.nextval, '테스트 제목', '테스트 내용','tester');

select * from book_board;

select * from book_board where bno > 0;
commit; -- 커밋 하기 ( *** 중요 *** )

select * from book_board order by bno desc;

select /*+ INDEX_DESC(book_board pk_book_board) */ * from book_board where bno > 0;

-- 페이지 1    
select /*+ INDEX_DESC(book_board pk_book_board) */ rownum rn, bno, title, content from book_board where rownum <= 10;

-- rownum은 반드시 1이 포함
select /*+ INDEX_DESC(book_board pk_book_board) */ rownum rn, bno, title, content from book_board where rownum <=20;

select bno, title, content from 
    ( select /*+ INDEX_DESC(book_board pk_book_board) */ rownum rn, bno, title, content
        from book_board where rownum <= 20 ) 
    where rn > 10;
    
create table book_reply(
    replyNo number(10,0), -- 댓글 번호  
    boardNo number(10,0) not null,  -- 게시글  번호    
    reply varchar2(1000) not null,  -- 댓글 내용    
    replyer varchar2(50) not null,  -- 댓글 작성자   
    replyDate date default sysdate, -- 작성일  
    updateDate date default sysdate -- 수정일  
);
create sequence seq_book_reply;
-- book_reply의 pk지정 
alter table book_reply add constraint pk_book_reply primary key(rno);

-- fk설정을 통해 book_board를 참조함
alter table book_reply add constraint fk_book_reply_board foreign key(bno) references book_board(bno);

select * from book_board where rownum < 10 order by bno desc;

select * from book_reply order by rno desc;

-- 인덱스  
create index idx_book_reply on book_reply(bno desc, rno asc);

select /*+ INDEX(book_reply idx_book_reply) */
    rownum rn, bno, rno, reply, replyer, replyDate, updatedate
    from book_reply
    where bno = 38 --게시물 번호 
    and rno > 0;

select rno, bno, reply, replyer, replyDate, updatedate
from ( select /*+ INDEX(book_reply idx_book_reply) */
        rownum rn, bno, rno, reply, replyer, replyDate, updatedate
        from book_reply
        where bno = 38 and rno >0 and rownum <= 20
        )
    where rn > 10;
    
-- 댓글과 댓글 수에 대한 처리  
alter table book_board add(replyCnt number default 0);  -- replyCnt 추가
alter table book_board add(reviewCnt number default 0);

update book_board set replyCnt = (select count(rno) from book_reply where book_reply.bno = book_board.bno);

-- 리뷰   
create table book_review(
    rno number(10,0), -- 리뷰 댓글 번호  
    bno number(10,0) not null,  -- 도서 상품 번호    
    review varchar2(1000) not null,  -- 리뷰 내용    
    reviewer varchar2(50) not null,  -- 리뷰 작성자  
    rating number(2,1),    -- 별점   
    reviewDate date default sysdate, -- 작성일  
    updateDate date default sysdate -- 수정일 
);
create sequence seq_book_review;
alter table book_review modify rating null;
-- pk
alter table book_review add constraint pk_book_review primary key(rno);
-- fk
alter table book_review add constraint fk_book_review foreign key(bno) references book_board(bno);

-- 도서정보
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
drop table tbl_book;
-- fk 삭제    
alter table book_review drop CONSTRAINT fk_book_review;
create SEQUENCE seq_book;
alter table tbl_book add constraint pk_book primary key(bno);

insert into tbl_book (bno, author, title, category) values(seq_book.nextval, '홍길동', '홍길동전', '인문');
insert into tbl_book (bno, author, title, category) values(seq_book.nextval, '박필준', 'Do it! 아두이노','IT');
insert into tbl_book (bno, author, title, category) values(seq_book.nextval, '구멍가게 코딩단', '스프링 웹 프로젝트', 'IT');
insert into tbl_book (bno, author, title, category) values(seq_book.nextval, '신짱구', '짱구는 못말려','만화');
insert into tbl_book (bno, author, title, category) values(seq_book.nextval, '백종원의 요리교실', '백종원','요리');

select * from tbl_book;
alter table tbl_book add(reviewCnt number default 0);   