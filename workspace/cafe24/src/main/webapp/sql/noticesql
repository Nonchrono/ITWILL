-- 1) 테이블 생성

create table notice(
 noticeno   int           not null auto_increment primary key -- 일련번호
,subject    varchar(255)    not null  -- 제목
,content    varchar(4000)   not null  -- 내용
,regdt      datetime    not null   -- 작성일
);

drop table notice;



select * from notice;

select noticeno, subject, content, regdt
from notice;


----------------------------------------------------------------------------------

INSERT INTO notice (subject, content, regdt)
VALUES ('관리자', '첫 게시글', now());


SELECT *
FROM (
      SELECT bbsno, subject, wname, readcnt, grpno, ansnum, indent, regdt, (@rownum := @rownum + 1) as r
      FROM (
             SELECT bbsno, subject, wname, readcnt, grpno, ansnum, indent, regdt
             FROM tb_bbs
          ) AA, (SELECT @rownum := 0) AS CC
          ORDER BY grpno DESC, ansnum ASC
       ) BB
WHERE r >= 1  AND r <= 10;
