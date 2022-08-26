● [테이블 조인의 종류] 

1) inner join
   - 두 테이블에 공통으로 존재하는 칼럼을 이용하는 방식
   - inner 생략가능
   - 기본
   
2) left outer join
   - 왼쪽 테이블의 모든 데이터와 오른쪽 테이블의 동일 데이터를 추출
   - outer 생략가능
   
3) right outer join
   - 오른쪽 테이블의 모든 데이터와 왼쪽 테이블의 동일 데이터를 추출
   - outer 생략가능
   
● [left join과 right join]

-- 학생 테이블의 모든 행을 가져오고, 수강테이블에서 학번이 일치하는 행만 가져오기

select st.*, su.*
from tb_student st left join tb_sugang su
on st.hakno = su.hakno;


-- 문1)left join를 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오
select st.hakno, st.uname, su.gcode
from tb_student st left join tb_sugang su
on st.hakno = su.hakno
where su.hakno is null;

-- 문2)right join를 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오

select st.hakno, st.uname, su.gcode
from tb_sugang su right join tb_student st
on su.hakno = st.hakno
where su.hakno is null;

--● [ (+)기호를 이용한 테이블 조인 ] 
   --(+)기호는 일치되지 않는 행이 존재하는 않은 쪽에 붙인다 -- 잘 쓰지 않음
   
   
select st.hakno, st.uname, su.gcode, su.hakno
from tb_student st, tb_sugang su
where st.hakno = su.hakno (+); -- left join

select st.hakno, st.uname, su.gcode, su.hakno
from tb_sugang su, tb_student st
where st.hakno(+) = su.hakno; -- right join