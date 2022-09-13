select * from sungjuk;

--문1) 국어점수가 50점이상 행을 조회하시오

select uname, kor
from sungjuk
where kor >= 50;


--문2) 영어 점수가 50점미만 행을 조회하시오

select uname, eng
from sungjuk
where 50 >= eng;


--문3) 이름이 '대한민국' 행을 조회(출력)하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
where uname = '대한민국';


--문4) 이름이 '대한민국' 아닌 행을 조회하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
where uname != '대한민국';


--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
where kor >= 90 and eng >= 90 and mat >= 90;


--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
where kor < 40 or eng < 40 or mat < 40;


--문7) 국어점수가 80 ~ 89점 사이 행을 조회하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
--where kor >= 80 and kor < 90;
where kor between 80 and 89;


--문8) 이름이 '무궁화', '봉선화'를 조회하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
--where uname = '무궁화' or uname = '봉선화';
where uname in ('무궁화','봉선화');

-- 국어점수 10, 30, 50점을 조회하시오

select uname, kor, eng, mat, tot, aver
from sungjuk
where kor = 10 or kor = 30 or kor = 50;


-- 문9) 국, 영, 수 모두 100점이 아닌 행을 조회하시오





--문1) 이름에서 '홍'으로 시작하는 이름을 조회하시오



--문2) 이름에서 '화'로 끝나는 이름을 조회하시오





--문3) 이름에 '나'글자 있는 이름을 조회하시오




--문4) 두글자 이름에서 '화'로 끝나는 이름을 조회하시오




--문5) 이름 세글자 중에서 가운데 글자가 '나' 있는 행을 조회하시오




-- 문6) 제목 + 내용을 선택하고 검색어가 '파스타'일 때
-- 제목이나 내용 둘 중 아무데나 파스타가 들어있으면 된다



-- 문7) 국어 점수가 50점 이상인 행에 대해서 총점과 평균을 구하시오



-- 평균에 비어있지 않은 행의 갯수를 구하시오 (null이 아닌 값)



-- 비어 있는 총점과 평균을 모두 구하시오

