● 연습문제

select count(*) from tb_student; -- 6개
select count(*) from tb_sugang; -- 14개
select count(*) from tb_gwamok; -- 9개

--문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
--    (학번, 이름, 과목코드)

-- 디자인 과목의 과목코드랑 과목명, 학점 구하기
select gcode, gname, ghakjum
from tb_gwamok
where gcode like 'd%'
order by ghakjum desc;

-- 과목코드, 학번, 학점 합계 구하기
select su.gcode, hakno, sum(ghakjum) as hap
from tb_gwamok gw join tb_sugang su
on gw.gcode = su.gcode
where su.gcode like 'd%'
group by su.gcode, hakno
order by hap desc;

-- 최고값만 추출
select AA.gcode, AA.hakno, st.uname
from (
            select su.gcode, hakno, sum(ghakjum) as hap
            from tb_gwamok gw join tb_sugang su
            on gw.gcode = su.gcode
            where su.gcode like 'd%'
            group by su.gcode, hakno
            order by hap desc
        ) AA join tb_student st
        on AA.hakno = st.hakno
where rownum = 1;

-- max로 조건을 거는 방법도 있다.



-- 디자인 교과목의 학점 조회하기
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

-- 1) 디자인 교과목 중에서 학점이 제일 많은 학점 조회하기
select max(ghakjum) from tb_gwamok where gcode like 'd%';

-- 2) 1) 결과에서 나온 학점 (5)과 동일한 학점을 갖고 있는 행에서 과목코드 선택
-- 즉, 디자인 교과목 중에서 학점이 제일 많은 과목코드 (단, 중복된 학점이 없다는 가정 하에)
select gcode
from tb_gwamok
where ghakjum = (5)
and gcode like 'd%';

select gcode
from tb_gwamok
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';

-- 3) 2)에서 나온 과목코드 (d002)를 수강신청한 명단을 조회
select gcode, hakno from tb_sugang where gcode = ('d002');

select gcode, hakno
from tb_sugang
where gcode = (
                        select gcode
                        from tb_gwamok
                        where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
                        and gcode like 'd%'
                    );
                    
-- 4) 3)의 결과를 AA 테이블로 만든 후, 학생 테이블을 조인해서 이름 가져오기

select AA.gcode, AA.hakno, ST.uname
from (
            select gcode, hakno
            from tb_sugang
            where gcode = (
                                    select gcode
                                    from tb_gwamok
                                    where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
                                    and gcode like 'd%'
                                )
            ) AA join tb_student ST
on AA.hakno = ST.hakno;


-- 경환형 답변

select SU.hakno, uname, SU.gcode
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.gcode like 'd%' and ghakjum = (
                                        select max(ghakjum)
                                        from tb_gwamok
                                        where gcode like 'd%'
                                        );

                    
/////////////////////////////////////////////////////////////////////////////////////////////////////////


--문2) 학번별 수강신청한 총학점을 구하고 학번별 정렬해서 줄번호 4~6행 조회하시오
--    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시)

-- 수강신청 안 해서 null값
select st.hakno
from tb_student st left join tb_sugang su
on st.hakno = su.hakno
where su.hakno is null;

-- null인 부분 AA로 수정
select *
from (
        select st.hakno
        from tb_student st left join tb_sugang su
        on st.hakno = su.hakno
        where su.hakno is null
        ) AA;

-- 학번별 수강신청 총학점
select st.hakno, sum(nvl(ghakjum,0))
from tb_student st full join tb_sugang su
on st.hakno = su.hakno full join tb_gwamok gw
on su.gcode = gw.gcode
where st.hakno is not null
group by st.hakno
order by st.hakno asc;

-- rownum 추가해서 순서 부여하기
select AA.hakno, AA.sum, rownum as rnum
from (
            select st.hakno, sum(nvl(ghakjum,0)) as sum
            from tb_student st full join tb_sugang su
            on st.hakno = su.hakno full join tb_gwamok gw
            on su.gcode = gw.gcode
            where st.hakno is not null
            group by st.hakno
            order by st.hakno asc
        ) AA;

-- rownum 조건을 넣어서 4~6등 추려내기
select BB.hakno, BB.sum, rnum
      from  (
        select AA.hakno, AA.sum, rownum as rnum
        from (
                    select st.hakno, sum(nvl(ghakjum,0)) as sum
                    from tb_student st full join tb_sugang su
                    on st.hakno = su.hakno full join tb_gwamok gw
                    on su.gcode = gw.gcode
                    where st.hakno is not null
                    group by st.hakno
                    order by st.hakno asc
                ) AA
        ) BB
where rnum >= 4 and rnum <= 6;


-- left 조인으로 다시 풀기
select BB.hakno, BB.sum, rnum
      from  (
        select AA.hakno, AA.sum, rownum as rnum
        from (
                    select st.hakno, sum(nvl(ghakjum,0)) as sum
                    from tb_student st left join tb_sugang su
                    on st.hakno = su.hakno left join tb_gwamok gw
                    on su.gcode = gw.gcode
                    group by st.hakno
                    order by st.hakno asc
                ) AA
        ) BB
where rnum >= 4 and rnum <= 6;




-- 학생 테이블 조회하기
select hakno, uname from tb_student order by hakno;

-- 1) 수강신청한 과목의 학점을 가져오기
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang SU join tb_gwamok GW
on su.gcode = gw.gcode;

-- 2) 학번별로 총학점을 구하라
select su.hakno, sum(gw.ghakjum) as 총학점
from tb_sugang SU join tb_gwamok GW
on su.gcode = gw.gcode
group by hakno
order by hakno;

-- 3) 수강신청하지 않은 학생들도 가져올 수 있도록 학생 테이블 left join
        -- 2) 결과 (AA 테이블)를 붙임

-- 총학점이 null이면 0으로 바꾸고, 학번순으로 조회하기
select st.hakno, st.uname, nvl(aa.총학점, 0)
from tb_student st left join (
                                        select su.hakno, sum(gw.ghakjum) as 총학점
                                        from tb_sugang SU join tb_gwamok GW
                                        on su.gcode = gw.gcode
                                        group by hakno
                                        order by hakno
                                      ) AA
on ST.hakno = AA.hakno
order by st.hakno;

-- 5) 줄번호 추가 (줄번호가 있는 상태에서 정렬됨)
select st.hakno, st.uname, nvl(aa.총학점, 0), rownum as rnum
from tb_student st left join (
                                        select su.hakno, sum(gw.ghakjum) as 총학점
                                        from tb_sugang SU join tb_gwamok GW
                                        on su.gcode = gw.gcode
                                        group by hakno
                                        order by hakno
                                      ) AA
on ST.hakno = AA.hakno
order by st.hakno;


-- 6) 5)의 결과를 셀프조인하고 나서 줄번호 추가하기


select bb.hakno, bb.uname, bb.총학점2, rownum as rnum
from (
            select st.hakno, st.uname, nvl(AA.총학점, 0) as 총학점2
            from tb_student st left join (
                                                    select su.hakno, sum(gw.ghakjum) as 총학점
                                                    from tb_sugang SU join tb_gwamok GW
                                                    on su.gcode = gw.gcode
                                                    group by hakno
                                                  ) AA
            on ST.hakno = AA.hakno
            order by st.hakno
        ) BB;

-- 7) 6)의 결과를 셀프조인(CC테이블) 하고 줄번호(rnum) 4~6 조회하기
select cc.hakno, cc.uname, cc.총학점2, rnum
from (select bb.hakno, bb.uname, bb.총학점2, rownum as rnum
        from (
                    select st.hakno, st.uname, nvl(AA.총학점, 0) as 총학점2
                    from tb_student st left join (
                                                    select su.hakno, sum(gw.ghakjum) as 총학점
                                                    from tb_sugang SU join tb_gwamok GW
                                                    on su.gcode = gw.gcode
                                                    group by hakno
                                                  ) AA
                    on ST.hakno = AA.hakno
                    order by st.hakno
                ) BB
            ) CC
where rnum between 4 and 6;


문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
     위에서 부터 1건만 조회하시오 (학번, 이름, 총학점) 
-- 수강테이블에 행추가 해주세요
-- (총학점이 다 같은 값이여서 결과확인하기가 조금 애매 합니다)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;
--총학점이 null이면 0으로 바꾸고 학번 순으로 정렬하기


-- 1) 과목코드가 일치하는 학점 가져오기
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode;

-- 2) 학번별로 총학점 구하고 총학점순으로 내림차순 정렬하기
select su.hakno, sum(gw.ghakjum) as 총학점
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno
order by sum(gw.ghakjum) desc;


-- 3) 2)의 결과를 AA 테이블로 만들고, 학생 테이블 조인해서 이름 가져오기
select AA.hakno, AA.총학점, uname, rownum as rnum
from (
            select su.hakno, sum(gw.ghakjum) as 총학점
            from tb_sugang su join tb_gwamok gw
            on su.gcode = gw.gcode
            group by su.hakno
            order by sum(gw.ghakjum) desc
        ) AA join tb_student st
on AA.hakno = st.hakno;


-- 4) 3)의 결과를 셀프조인하고 줄번호를 이용해서 위에서부터 1건만 조회하기
select hakno, 총학점, uname
from (
            select AA.hakno, AA.총학점, uname, rownum as rnum
            from (
                        select su.hakno, sum(gw.ghakjum) as 총학점
                        from tb_sugang su join tb_gwamok gw
                        on su.gcode = gw.gcode
                        group by su.hakno
                        order by sum(gw.ghakjum) desc
                    ) AA join tb_student st
            on AA.hakno = st.hakno
        )
        where rownum = 1;



-- 학번별 수강신청 총학점
select st.hakno, sum(nvl(ghakjum,0)) as sum
from tb_student st full join tb_sugang su
on st.hakno = su.hakno full join tb_gwamok gw
on su.gcode = gw.gcode
where st.hakno is not null
group by st.hakno
order by sum desc;

-- 번호 추출
select hakno, hap, uname, rownum
from
    (
        select st.hakno, sum(nvl(ghakjum,0)) as hap, uname
        from tb_student st full join tb_sugang su
        on st.hakno = su.hakno full join tb_gwamok gw
        on su.gcode = gw.gcode
        where st.hakno is not null
        group by st.hakno, uname
        order by hap desc
    ) AA
where rownum = 1;