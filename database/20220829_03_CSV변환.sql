20220829_03CSV변환.sql

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

● [CSV 파일]
    - 모든 데이터가 , 로 구분되어 있는 파일
    
● [CSV 파일을 데이터베이스로 가져오기]
    - 공공데이터포털 https://data.go.kr/ 활용
    
문) 도로명 우편번호 테이블 구축하기              

-- 1) zipdoro.csv 준비 (258267행)

-- 2) zipdoro.csv 내용을 저장하는 zipdoro 테이블을 생성
create table zipdoro (
    zipno           char(5)             -- 우편번호
    ,zipaddress   varchar(1000)    -- 주소
);

commit;

drop table zipdoro;
select * from zipdoro;

-- 3) 가져오기와 내보내기
-   zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
-   zipdoro 테이블 우클릭 -> export          (내보내기)


select count(*) from zipdoro; -- 전체 행 갯수 조회하기





-- 서울특별시 강남구로 시작되는 우편번호가 몇개인지 확인하시오

select count(*)
from zipdoro
where zipaddress like ('서울특별시 강남구%');


//////////////////////////////////////////////////////////////////////////////////////////////

-- 문2) 한국교원대학교_초등학교 위치.csv를 반환하시오

-- 비어있는 값(null)을 찾으시오


create table school (
        schoolid            varchar(10)       -- 학교ID
    ,   schoolname       varchar(255)      -- 학교명
    ,   schoolgubun      varchar(20)        -- 학교급구분
    ,   schooladdr         varchar(255)      -- 소재지도로s명
    ,   cdate                date                  -- 생성일자 (형식 YYYY-MM-DD)
    ,   udate                date                  -- 변경일자 (형식 YYYY-MM-DD)
    ,   latitude              number(20,9)     -- 위도
    ,   longitude            number(20,9)     -- 경도
);

select count(*) from school;
drop table school;


select * from school
where schoolid is null
or schoolname is null
or schoolgubun is null
or schooladdr is null
or cdate is null
or udate is null
or latitude is null
or longitude is null;

-- 과제) 각 시도별 초등학교, 중학교 갯수를 구하시오

-- 초등학교, 중학교 선별
select *
from school
where schoolgubun = '초등학교' or schoolgubun = '중학교';

-- 글자 자르기
select substr(schooladdr, 0, 2)
from school;

-- 그룹화
select substr(schooladdr, 0, 2) as 지역, schoolgubun, count(substr(schooladdr, 0, 2)) cnt
from school
where schoolgubun = '초등학교' or schoolgubun = '중학교' and schooladdr is not null
group by substr(schooladdr, 0, 2), schoolgubun;

-- 한이누나 답변 (문자열 공백 찾아서 해보기)
select substr(schooladdr, 0, instr(schooladdr, ' ', 1)) , schoolgubun, count(*)
from school
group by substr(schooladdr, 0, instr(schooladdr, ' ', 1)), schoolgubun
having schoolgubun <>'고등학교'
order by substr(schooladdr, 0, instr(schooladdr, ' ', 1)), schoolgubun desc;

-- 경환형 답변
select
     nvl(cho.addr1, '-')
    ,nvl(cho.ckinds, '초등학교') as 학교구분
    ,nvl(cho.c_cnt, 0) as 갯수
    ,nvl(jung.addr2, '-')
    ,nvl(jung.jkinds, '중학교') as 학교구분
    ,nvl(jung.j_cnt, 0) as 갯수
from(
    select addr1, ckinds, count(*) as c_cnt
    from (
        select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr1, schoolgubun as ckinds
        from school
        )
    group by addr1, ckinds
    having ckinds like '초%'
    ) cho full join (
                select addr2, jkinds, count(*) as j_cnt
                from (
                    select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr2, schoolgubun as jkinds
                    from school
                    )
                group by addr2, jkinds
                having jkinds like '중%'
                ) jung
on cho.addr1 = jung.addr2
order by cho.addr1;