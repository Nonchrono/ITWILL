
-- 데이터베이스 생성
create database bookmark;

use bookmark;


-- 답변형 게시판 테이블 생성
CREATE TABLE book_bbs (
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
   ,secretp     CHAR(1)       NOT NULL
   ,writer      varchar(50)   NOT NULL
);

SELECT * FROM book_bbs;