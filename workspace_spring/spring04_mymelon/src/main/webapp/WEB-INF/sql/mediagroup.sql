-- mediagroup_sql.txt

-- 미디어 그룹 테이블 생성
CREATE TABLE mediagroup (
    mediagroupno NUMBER        NOT NULL PRIMARY KEY, -- 그룹번호
    title        VARCHAR2(255) NOT NULL              -- 그룹제목
);

-- 시퀀스 생성
create sequence mediagroup_seq;

commit;

select * from mediagroup;


SELECT AA.*
FROM (
        SELECT ROWNUM as RNUM, BB.*
        FROM (
                SELECT mediagroupno, title
                FROM mediagroup
                ORDER BY mediagroupno DESC
             ) BB
        ) AA
WHERE AA.RNUM >=1 AND AA.RNUM <=  3;

SELECT COUNT(*) FROM mediagroup;