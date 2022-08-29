● [모조칼럼]

    - Oracle DBMS에서 제공해준다
    
    - rownum 행번호
       select uname, address, rownum from tb_student;
       
    - rowid 행의 주소값
       select uname, address, rowid from tb_student;
    
    -- 유일성. 중복되지 않게 관리해준다.
    
    ///////////////////////////////////////////////////////////////////////////////////////
    
● [rownum]

-- 줄번호
select hakno, uname, rownum from tb_student;

-- 줄번호에 별칭 부여하기
select hakno, uname, rownum  as rnum from tb_student;

-- 줄번호가 먼저 부여되고 정렬된다
select hakno, uname, rownum  as rnum from tb_student order by uname;

-- 줄번호 1 ~ 3 사이 조회
select hakno, uname, rownum from tb_student where rownum >= 1 and rownum <=3;

-- 줄번호 4 ~ 6 사이 조회 (조회 안 됨)
select hakno, uname, rownum from tb_student where rownum >= 4 and rownum <=6;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

● [rownum를 활용한 페이징]
    - rownum은 모조칼럼이므로 조건절에 직접 사용하지 말고 실제 칼럼으로 인식을 먼저 시킨 후 사용할 것을 추천함
    - rownum 칼럼은 셀프조인 후에 줄번호 추가하고 조건절에 활용하자
    

문) 줄번호(rownum)을 이용해서 줄번호 4 ~ 6 조회

-- 이름순으로 조회 (줄번호까지 같이 정렬)
select uname, hakno, address, rownum
from tb_student
order by uname;

-- 2) 1)의 결과를 셀프조인(AA테이블)하고 줄번호를 추가하시오
select uname, hakno, address, rownum
from (select uname, hakno, address
from tb_student
order by uname) AA;

-- 3) 2)의 결과를 BB 테이블로 만들고 줄번호 4~6행 조회하시오

select uname, hakno, address, rnum
from (
        select AA.uname, AA.hakno, AA.address, rownum as rnum
        from (
                 select uname, hakno, address
                 from tb_student
                 order by uname
                ) AA
    ) BB 
where rnum >= 4 and rnum <= 6;



-- 4) 3)의 결과에서 테이블 별칭 (AA, BB) 생략하기

select *
from (
        select uname, hakno, address, rownum as rnum
        from (
                 select uname, hakno, address
                 from tb_student
                 order by uname
                ) 
    ) 
where rnum >= 4 and rnum <= 6;