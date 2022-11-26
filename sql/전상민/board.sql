create sequence seq_board;

create table tbl_board(
    boardNo number(10,0),   -- 게시글 번호   
    title varchar2(200) not null,   -- 게시글 제목   
    content varchar2(2000) not null,    -- 게시글 내용
    writer varchar2(50) not null,   -- 게시글 작성자  
    regdate date default sysdate,   -- 게시글 작성일
    updatedate date default sysdate     -- 게시글 수정일  
);
alter table tbl_board add CONSTRAINT pk_board primary key(boardNo);

-- tbl_board에 replyCnt 추가
alter table tbl_board add (replyCnt number default 0);
-- 기존의 댓글 replyCnt에 반영  
update tbl_board set replyCnt = (select count(replyNo) from tbl_reply where tbl_reply.boardNo = tbl_board.boardNo);