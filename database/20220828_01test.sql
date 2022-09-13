--문1)수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오

select hakno, uname, address from tb_student
where address = '제주';


--문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     --서울 2명
     --제주 2명
     
select * from tb_sugang su join tb_student st on su.hakno = st.hakno;
     
select address, uname
from tb_sugang su join tb_student st
on su.hakno = st.hakno
group by address, uname;

select address || ' ' || count(*) || '명' as cnt
from (select st.hakno, address
        from tb_sugang su join tb_student st
        on su.hakno = st.hakno
        group by st.hakno, address)
group by address;

--문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     --d001 HTML   2명 
     --d002 포토샵   1명
     --p001 OOP    2명
     

select gw.gcode, gname, count(*) || '명' as 인원
from tb_gwamok gw join tb_sugang su
on gw.gcode = su.gcode
group by gw.gcode, gname;


--문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     --g1001  홍길동  9학점
     --g1002  홍길동  6학점
     --g1005  진달래  9학점
     
select su.hakno, ghakjum
from tb_gwamok gw join tb_sugang su
on gw.gcode = su.gcode;

select AA.hakno, st.uname, sum(AA.ghakjum)
from (select su.hakno, ghakjum
        from tb_gwamok gw join tb_sugang su
        on gw.gcode = su.gcode) AA join tb_student st
on AA.hakno = st.hakno
group by AA.hakno, st.uname;

--문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     --g1001  p001  OOP
     --g1001  p003  JSP  
     --g1001  d001  HTML
     
select su.hakno, ssu.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno = 'g1001'
group by su.gcode, gw.gname, su.hakno;

    
-- 문6)수강신청을 한 학생들의 학번, 이름 조회

select su.hakno, uname
from tb_sugang su join tb_student st
on su.hakno = st.hakno
group by su.hakno, uname;



-- 문7)수강신청을 하지 않은 학생들의 학번, 이름 조회

select * from tb_sugang;

select st.hakno, st.uname
from tb_student st left join tb_sugang su
on su.hakno = st.hakno
where su.hakno is null;


                            
-- 문8) daum이메일을 쓰는 학생은 누구고 학점은 몇점인가요?


select uname, email, sum(ghakjum) || '점'  as 학점
from tb_student st join tb_sugang su
on st.hakno = su.hakno join tb_gwamok gw
on su.gcode = gw.gcode
where email like '%daum%'
group by uname, email;


-- 문9) 복수전공을 하고있는 학생들은 누구인가요? 


select gname, uname  
from tb_student st join tb_sugang su
on st.hakno = su.hakno join tb_gwamok gw
on su.gcode = gw.gcode
group by uname, gname
having count (uname) >= 2;