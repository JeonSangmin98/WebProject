create table tbl_member(
    memberID varchar2(50),      -- 회원 아이디   
    memberPW varchar2(100),     -- 회원 비밀번호  
    memberName varchar2(30),    -- 회원 이름    
    memberMail varchar2(100),   -- 회원 메일    
    memberAddr1 varchar2(100),  -- 회원 주소1
    memberAddr2 varchar2(100),  -- 회원 주소2   
    memberAddr3 varchar2(100),  -- 회원 주소3
    regDate date default sysdate    -- 회원가입일  
);
alter table tbl_member add constraint pk_member primary key(memberId);