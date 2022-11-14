테이블
생성 /src/main/webapp/sql

-----------------------------------------------------------------------

-- 상품 댓글 테이블
create table pcomment
(
    cno      number primary key     -- 댓글번호
    ,
    pno      number not null        -- 부모글 번호
    ,
    content  varchar2(255) not null -- 댓글내용
    ,
    wname    varchar2(100) not null -- 작성자
    ,
    regdate  date   default sysdate -- 작성일
);

-- MariaDB ver.
create table pcomment
(
    cno      int primary key     -- 댓글번호
    ,
    pno      int not null        -- 부모글 번호
    ,
    content  NVARCHAR not null -- 댓글내용
    ,
    wname    NVARCHAR not null -- 작성자
    ,
    regdate  date   default sysdate -- 작성일
);

-- 테이블 드랍
drop table pcomment;

-- 댓글 시퀀스
create sequence pcomment_seq;

drop sequence pcomment_seq;

-- 커밋
commit;

-- 전체 조회
select * from pcomment;