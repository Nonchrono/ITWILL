-- 1) 테이블 생성

create table notice(
 noticeno   number           not null  -- 일련번호
,subject    varchar2(255)    not null  -- 제목
,content    varchar2(4000)   not null  -- 내용
,regdt      date    default  sysdate   -- 작성일
,primary key(noticeno)                 -- noticeno 기본키
);


-- 2) 일련번호 시퀀스 생성

create sequence noticeno_seq;

select * from notice;

select noticeno, subject, content, regdt
from notice;