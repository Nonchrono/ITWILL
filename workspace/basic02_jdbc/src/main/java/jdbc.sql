-- sungjuk 테이블 행 추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)


-- 오라클 콘솔창 예쁘게 출력
set linesize 1000;
coㅣ uname for a10; -- col 칼럼명 for 20자
col addr for a10; -- col 칼럼명 for 20자



select *
from sungjuk
order by sno desc;

-- 문제) 주소가 서울인 행들의 국영수 평균값을 구하시오
-- 단, 소수점은 반올림해서 둘째자리값까지 표현

-- 내 대답
select round(avg(kor),2) as avgkor, round(avg(eng),2) as avgeng, round(avg(mat),2) as avgmat
from sungjuk
where addr = 'Seoul';

-- 1) 주소가 서울인 행 조회하기
select addr, uname, kor, eng, mat
from sungjuk
where addr = 'Seoul';

-- 2) 주소가 서울인 행을 대상으로 국영수 평균 구하기
select avg(kor), avg(eng), avg(mat)
from sungjuk
where addr = 'Seoul';

-- 3) 주소가 서울인 행을 대상으로 국영수 평균을 구하고 반올림해서 소수점 둘째 자리까지 표현
select round(avg(kor),2), round(avg(eng),2), round(avg(mat),2)
from sungjuk
where addr = 'Seoul';

-- 4) 주소가 서울인 행을 대상으로 국영수 평균 구하고 반올림해서 소주점 둘째 자리까지 표현하고 칼럼명 변경
select round(avg(kor),2) as avg_kor
	, round(avg(eng),2) as avg_eng
	, round(avg(mat),2) as avg_mat
from sungjuk
where addr = 'Seoul';



-- 문제) 이름에 '나' 문자가 있는 행을 조회하시오
select sno, uname, kor, eng, mat, tot, aver, addr, wdate
from sungjuk
where uname like '%나%';


-- 문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오

-- 내 대답
select su.hakno, su.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno = 'g1001'
order by gcode;



-- 문제) sungjuk 테이블에서 이름순으로 정렬 후 행번호 4~6행만 조회하시오
select sno, uname, kor, eng, mat, tot, aver, addr from sungjuk order by uname;

select bb.*
from (
	select rownum as rnum, aa.*
	from (
		select sno, uname, kor, eng, mat, tot, aver, addr from sungjuk order by uname
		  ) aa
	) bb
where bb.rnum between 4 and 6;




-- 문제) sungjuk 테이블에서 이름순으로 정렬 후 행번호 4~6행만 조회하시오
1)
select uname, aver, addr
from sungjuk
order by uname;

2)
select uname, aver, addr, rownum
from sungjuk
order by uname;

3) 1)의 결과를 한번더 셀프 조인하고 rownum 추가하기
select uname, aver, addr, rownum
from (
	select uname, aver, addr
	from sungjuk
	order by uname
	);
	
4) 행번호 4~6 조회하기
select uname, aver, addr, rownum
from (
	select uname, aver, addr
	from sungjuk
	order by uname
	)
where rownum >=4 and rownum <=6;


5) 3)의 내용을 한번 더 셀프조인한 행번호 4~6 조회하기

select *
from (
		select uname, aver, addr, rownum as rnum
from (
	select uname, aver, addr
	from sungjuk
	order by uname
	)
)
where rnum >= 4 and rnum <= 6; 