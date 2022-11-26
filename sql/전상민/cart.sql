create table tbl_cart(
    cartBno number(20,0),
    bno number(20,0),
    title varchar2(200),
    discount number(20,0),
    category varchar2(20),
    image varchar2(300),
    count number(10,0)
);
alter table tbl_cart add constraint pk_cart primary key(cartBno);
alter table tbl_cart add constraint fk_cart foreign key(bno) references tbl_book(bno);