
-- 미디어 테이블 생성

CREATE TABLE media (
  mediano  NUMBER        NOT NULL PRIMARY KEY,          -- 미디어 번호
  title    VARCHAR2(255) NOT NULL,                      -- 제목
  poster   VARCHAR2(255) DEFAULT 'poster.jpg' NOT NULL, -- 포스터 이미지
  filename VARCHAR2(255) NOT NULL,                      -- 음원 파일명
  filesize NUMBER        DEFAULT 0 NOT NULL,
mview    CHAR(1)       DEFAULT 'Y' NOT NULL,          -- 출력모드. 게시판에 노출시키고 싶지 않을 때 Y가 값으로 들어간 것만 보여줄 예정
  rdate    DATE          NOT NULL,                      -- 등록일
  mediagroupno NUMBER    NULL                           -- 부모테이블 PK
);


-- 시퀀스 생성
create sequence media_seq;

DROP sequence media_seq;

select * from media;

commit;

-- 행목록
select * from media
where mview = 'Y' and mediagroupno = ?
order by mediano desc
;

drop table media
;