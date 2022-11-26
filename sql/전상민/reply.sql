create SEQUENCE seq_reply;
create table tbl_reply(
    replyNo number(10,0),   -- 댓글 번호    
    boardNo number(10,0) not null,  --게시글 번호    
    reply varchar2(1000) not null,  -- 댓글 내용
    replyer varchar2(50) not null,  -- 댓글 작성자   
    replyDate date default sysdate, -- 댓글 작성일   
    updateDate date default sysdate -- 댓글 수정
);
-- pk
alter table tbl_reply add constraint pk_reply primary key(replyNo);
-- fk
alter table tbl_reply add constraint fk_reply foreign key(boardNo) references tbl_board(boardNo);

-- index 
create index idx_reply on tbl_reply(boardNo desc, replyNo asc);