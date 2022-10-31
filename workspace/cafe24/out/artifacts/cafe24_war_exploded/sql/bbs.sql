-- Maria DB 기반

-- bbs.sql

-- 답변형 게시판 테이블 생성
CREATE TABLE tb_bbs (
   bbsno        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
   ,wname       VARCHAR(20)   NOT NULL
   ,subject     VARCHAR(100)  NOT NULL
   ,content     TEXT          NOT NULL
   ,grpno       TINYINT       NOT NULL
   ,indent      TINYINT       DEFAULT 0    NOT NULL
   ,ansnum      TINYINT       DEFAULT 0    NOT NULL
   ,regdt       DATETIME      NOT NULL
   ,passwd      VARCHAR(15)   NOT NULL
   ,readcnt     INT           DEFAULT 0    NOT NULL
   ,ip          VARCHAR(15)   NOT NULL
   ,secretp     CHAR(1)         NOT NULL
   ,writer         varchar(50)      NOT NULL
);

-- 행추가 테스트
insert into tb_bbs(wname,subject,content,grpno,passwd,ip,regdt, secretp, writer)
values('무궁화','대한민국','오필승코리아',(select ifnull(max(bbsno),0)+1 from tb_bbs as TB),'1234','127.0.0.1',now(),'0','guest');

select * from tb_bbs;

commit;


SELECT bbsno, subject, wname, content, readcnt, grpno, ansnum, indent, regdt, secretp, writer, @rownum := @rownum + 1 as r
FROM (
           SELECT bbsno, subject, wname, content, readcnt, grpno, ansnum, indent, regdt, secretp, writer
           FROM tb_bbs
         ) AA, (SELECT @rownum := 0) AS CC 
ORDER BY grpno DESC, ansnum ASC;

delete from tb_bbs where bbsno = 17;

SELECT COUNT(*) as cnt FROM tb_bbs;