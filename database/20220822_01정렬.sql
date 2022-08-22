● [수업 내용]
    - sort 정렬
    - 테이블 수정
    - 시퀀스
    
//////////////////////////////////////////////////////////////////////

● [Sort 정렬]
    - 특정값(keyfield)을 기준으로 순서대로 재배치
    - 오름차순 Ascending Sort (ASC) - 생략하면 이게 기본값 1 -> 10  A -> Z  a -> z  ㄱ -> ㅎ 
    - 내림차순 Descending Sort (DESC)
    - 형식) order by 칼럼명1, 칼럼명2, 칼럼명3, ~~~
   
    
-- 성적 테이블을 조회하시오
select * from sungjuk;


-- 전체 레코드를 이름순으로 정렬해서 조회하시오
select uname
from sungjuk
order by uname asc; -- 오름차순 정렬 (asc 생략 가능)

select uname
from sungjuk
order by uname desc; -- 내림차순 정렬


-- 국어점수순으로 정렬해서 조회하시오
select uname, kor
from sungjuk
order by kor;

-- 1차 정렬 : 국어점수순으로 정렬
-- 2차 정렬 : 국어점수가 같다면 이름을 기준으로 내림차순 정렬

select uname, kor
from sungjuk
order by kor, uname desc;

-- 1차 (kor) 2차 (end), 3차 (mat) 정렬
select uname, kor, eng, mat
from sungjuk
order by kor desc, eng desc, mat desc;

select * from sungjuk;

--문제) 평균 70점 이하 행을 이름순으로 조회하시오

-- 내 대답
select uname, aver
from sungjuk
where aver <= 70
order by uname asc;


-- 평균 70점 이하 행 조회
select uname, aver
from sungjuk
where aver <= 70


select uname, aver
from sungjuk
where aver <= 70
order by uname;


select uname, aver
from sungjuk
order by uname
where aver >= 70; -- ORA-00933 에러




● [alter 문] - 테이블의 구조 수정 및 변경

1. 컬럼 추가
   형식) alter table table명 add (컬럼명 데이터타입);
   
-- music 칼럼 추가
alter table sungjuk add(music int null);
-- 상식적으로 들어가는 값이 not null이 될 수는 없다.

select * from sungjuk;
   
   
   
2. 컬럼명 수정
   형식) alter table table명 rename column 원래컬럼명 to 바꿀컬럼명;
   
-- 국어 칼럼 kor를 korea 칼럼명으로 수정하시오
alter table sungjuk rename column kor to korea;
select * from sungjuk;
   
   
   
3. 컬럼 데이터 타입 수정
  형식) alter table table명 modify(컬럼명 데이터타입);
  
-- music 칼럼의 자료형을 varchar로 수정하시오
alter table sungjuk modify(music varchar(5));
select * from sungjuk;
  
4. 컬럼 삭제
  형식)alter table table명 drop(컬럼명);
  
-- music 칼럼을 삭제하시오 
alter table sungjuk drop(music);
select * from sungjuk;