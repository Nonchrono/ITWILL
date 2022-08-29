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


create table school (
    schid            varchar(1000)    -- 학교ID
    ,schaddress   varchar(1000)    -- 학교명
    ,schlevel        varchar(1000)    -- 학교급구분
    ,schwhere      varchar(1000)     -- 소재지도로명
    ,schcreate      varchar(1000)     -- 생성일자
    ,schchange     varchar(1000)     -- 변경일자
    ,lat                 varchar(1000)    -- 위도
    ,har                varchar(1000)     -- 경도
);

select count(*) from school;
drop table school;


select * from school where schwhere is null;