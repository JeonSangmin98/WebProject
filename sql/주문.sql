create table tbl_orderItem(
    orderItemId number PRIMARY KEY,
    orderId varchar2(100 BYTE),
    bookbno number(20,0),
    OrderCount number(20,0) not null,
    bookPrice number(20,0) not null,
    bookDiscount number(20,0) not null,
    savePoint number not null,
    image varchar2(300 BYTE)
);

create table tbl_order(
    orderId varchar2(100 BYTE) primary key,
    addressee varchar2(100 BYTE) not null,
    memberId varchar2(100 BYTE),
    memberAddr1 varchar2(100) not null,
    memberAddr2 varchar2(100) not null,
    memberAddr3 varchar2(100) not null,
    orderState varchar2(100) not null,
    deliveryCost number(20,0) not null,
    usePoint number(20,0) not null,
    orderDate date default sysdate
);

alter table tbl_order add constraint fk_order_member foreign key (memberId) references tbl_member (memberId);

alter table tbl_orderItem add constraint fk_orderItem_order foreign key (orderId) references tbl_order (orderId);
alter table tbl_orderItem add constraint fk_orderItem_book foreign key (bookbno) references tbl_book (bno);

create sequence seq_orderItem;