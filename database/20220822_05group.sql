● [데이터 그룹화]

-- sungjuk_seq 시퀀스 삭제
drop sequence sungjuk_seq;

-- sungjuk 테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- sungjuk 테이블 삭제
drop table sungjuk;

-- sungjuk 테이블 생성
create table sungjuk(
    sno      int              primary key     -- 기본키(유일성). 중복 허락 x
    ,uname varchar(50) not null
    ,kor      int              check(kor between 0 and 100) -- 국어 점수 0 - 100 사이만 입력 가능
    ,eng      int              check(eng between 0 and 100) -- 영어 점수 0 - 100 사이만 입력 가능
    ,mat      int              check(mat between 0 and 100) -- 수학 점수 0 - 100 사이만 입력 가능
    ,addr     varchar(20)  check(addr in ('Seoul','Jeju','Busan','Suwon')) -- 주소를 상기 네개의 도시로 제한
    ,tot        int              default 0
    ,aver     int              default 0
    ,wdate  date            default sysdate                       -- 현재 날짜 함수
);

select * from sungjuk;

● [sungjuk 테이블 입력 데이터]
※ 참조 : d:\java202207\database\20220822_03성적테이블.sql

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'솔데스크', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

select * from sungjuk;
select count(*) from sungjuk;
commit;

//////////////////////////////////////////////////////////////////////////////////////////////////

● [distinct]
    - 칼럼에 중복내용이 있으면 대표값 1개만 출력
    - 형식) distinct 칼럼명
    
select addr
from sungjuk
order by addr;
    
select addr
from sungjuk
order by addr asc; -- asc 생략 가능

select addr
from sungjuk
order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;


● [group by]
    - 칼럼에 동일 내용끼리 그룹화 시킴
    - 형식) group by 칼럼1, 칼럼2, 칼럼3, ~~
    
-- 주소가 동일한 값을 그룹화시키고 주소를 조회
select addr     -- 그룹화시키고 나올 수 있는 값은 1개로 표현 가능한 값만 조회
from sungjuk
group by addr; -- distinct과 동일


select addr from sungjuk order by addr;


-- 문1) 주소별 인원수를 조회하시오

select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt -- 칼럼명 임시 부여
from sungjuk
group by addr;

select addr, count(*) cnt
from sungjuk
group by addr;


-- 주소별 오름차순 정렬해서 조회
select addr, count(*) cnt
from sungjuk
group by addr
order by addr;

-- 주소별 인원수를 내림차순 정렬해서 조회
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt   -- 해석 순서 3)
from sungjuk                        -- 해석 순서 1)
group by addr                       -- 해석 순서 2)
order by cnt desc;                 -- 해석 순서 4)
////////////////////////////////////////////////////////////////////////////////////////////////

● [집계 함수]

-- 문2) 주소별 국어 점수에 대해서 집계하시오
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)    -- 갯수, 최대값, 최소값, 합계, 평균
from sungjuk
group by addr

-- 주소순으로 정렬
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)
from sungjuk
group by addr
order by addr;

-- round (값, 0) 소수점 이하값에서 반올림하고 소수점은 없음
-- round (값, 2) 라고 했다면 소수점 셋째자리에서 반올림을 했을 것
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0) 
from sungjuk
group by addr
order by addr;

-- 국어 평균을 소수점 없이 반올림하고 내림차순으로 정렬해서 조회
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)  
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

-- 칼럼명 부여
select addr
        , count(*) as cnt
        , max(kor) as max_kor
        , min(kor) as min_kor
        , sum(kor) as sum_kor
        , round(avg(kor), 0) as avg_kor  
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

--문3) 총점(tot), 평균(aver) 구하시오

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
select * from sungjuk;

--문4) 평균(aver)이 80점이상 행을 대상으로 주소별 인원수를 인원수순으로 조회하시오
select addr, count(*)
from sungjuk
where aver >= 80
group by addr
order by count(*);

commit;
