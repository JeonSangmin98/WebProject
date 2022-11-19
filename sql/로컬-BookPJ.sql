create table tbl_book (
    bno number(20, 0), --책 번호 seq 사용
    author varchar2(100) not null, --저자
    title varchar2(200) not null, --제목
    discount number(20, 0) not null, --가격
    pubdate date not null, --책 출판일 
    isbn number(20, 0) not null, --책 고유번호
    image varchar2(300) not null, -- 책 이미지
    category varchar2(20) not null, --카테고리
    publisher varchar2(100) not null, --책 출판사
    description varchar2(4000) not null, --책 상세정보
    primary key (bno) 
);

select * from tbl_book;
select * from tbl_book where category = 'IT';
select * from tbl_book where title like '%교%';

commit;

create table tbl_cart(
    cartBno number(20, 0),
    bno number(20, 0) not null,
    title varchar2(200) not null,
    discount number(20, 0) not null,
    category varchar2(20) not null,
    image varchar2(300) not null,
    count number(10, 0) default 1,
    primary key (cartBno)
);



create table tbl_cart(
    cartBno number(20, 0),
    bno number(20, 0) not null,
    title varchar2(200) not null,
    primary key (cartBno)
);




--테이블 명 / 제약 조건 명 / 컬럼명 / 참조테이블 (컬럼명)
alter table tbl_cart add constraint fk_cart_book foreign key (bno) references tbl_book (bno);

-- 외래키 삭제
alter table tbl_cart drop constraint fk_cart_book;

drop table tbl_cart;



select C.cartBno, B.bno, B.title
from tbl_book B
inner join tbl_cart C on B.bno = C.bno 
where B.title like '%교토%';

insert into tbl_cart(cartBno, bno, title) 
    values (seq_cart.nextval, 2, '교토 갈까?');



insert into tbl_cart (cartBno, cartDate, bno, title, discount, category, image) 
    values (seq_cart.nextval, '2022/11/16', 1, 'a', 20000, 'IT', 'a');   




select * from tbl_cart;
delete from tbl_cart where bno ='1';

select * from tbl_book where rownum <=10;



create sequence seq_cart;

create SEQUENCE seq_book;
drop sequence seq_book;
drop sequence seq_cart;













drop table tbl_book;
delete from tbl_book where bno ='6';









create table tbl_board(
    board_id number(10, 0),
    writer varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(2000) not null,
    regdate date default sysdate,
    updatedate date default sysdate
    --deletedate
)

create sequence seq_board;




drop table tbl_board;





	select bno, author, title, discount, pubdate, isbn, image, category, publisher, description from(
		select rownum rn, bno, author, title, discount, pubdate, isbn, image, category, publisher, description 
		from tbl_book
		where rownum <= 20)
		where rn > 5;


select count(*) from tbl_book where bno > 0;


--회원 테이블
create table tbl_member(
    memberId VARCHAR2(50), 
    memberPw VARCHAR2(100) NOT NULL,
    memberName VARCHAR2(30) NOT NULL,
    memberMail VARCHAR2(100) NOT NULL,
    regDate DATE NOT NULL, 
    PRIMARY KEY(memberId)
);

commit;

insert into tbl_member values ('admin', '1234', '홍길동', 'abc@naver.com', '2022/11/19');
insert into tbl_member values ('admin', '1234', '홍길동', 'abc@naver.com', sysdate());
select * from tbl_member;
drop table tbl_member;
