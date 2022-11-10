create table pcomment
(
    cno     number primary key     -- 댓글 번호
    ,
    pno     number       not null  -- 부모글 번호
    ,
    content varchar2(255) not null -- 댓글 내용
    ,
    wname   varchar(100) not null  -- 작성자
    ,
    regdate date default sysdate   -- 작성일
);

-- 댓글 시퀸스
create sequence pcomment_seq;

-- 커밋
commit;