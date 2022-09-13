● [자료형]
1) 문자형
    - 가변형   varchar(5)      'SKY' 5칸 할당하면 사용한만큼만, 즉 3칸만 사용한다. 예) 아이디, 비밀번호, 이름, 주소 --
    - 고정형   char(5)          'SKY' 할당한만큼의 메모리를 사용한다.                    예) 주민번호, 우편번호, 계좌번호, --

2) 숫자형
    - int 정수형
    
3) 날짜형
    - 년월일시분초
    - 구분기호 - 와 / 기호를 사용한다.
    - 문자열 타입으로 입력한다.
    - date

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

● [테이블 제약조건]

1) primary key
    기본키. 유일성. 모든 테이블에는 프라이머리 키가 하나 이상 존재해야한다.
    where 조건절에 걸릴 수 있는 대표적인 칼럼을 강제할 수 있다.
    예) 주민번호, 핸드폰 번호, 계좌 번호, 아이디, 이메일 --
    기본이 not null 속성을 갖고 있다. (빈값을 허용하지 않음. 반드시 데이터 입력해야함)
    중복을 허용하지 않는다.
    
2) not null
    빈값을 허용하지 않음
    
3) check
    입력할 값을 특정 범위로 제한하는 조건

4) default
    사용자가 값을 입력하지 않으면 해당 칼럼이 정의한 기본값을 자동으로 입력해준다.
    
5) unique
    중복 허용 안 함
    null 값은 한번만 허용

6) foreign key
    외래키
    테이블을 조인하는 경우 부모와 자식 관계를 설정

////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

[테이블 제약 조건 에러 메세지]

-- primary key 제약조건
-- ORA-00001 : 무결성 제약 조건 (SYSTEM.SYS_C007026)에 위배됩니다.
-- sno 칼럼은 기본키(PK)임으로 중복된 값을 허용하지 않음
insert into sungjuk(sno, uname) values(1, '홍길동'); -- 2번 실행했을 때 에러 발생


-- not null 제약 조건
-- ORA-01400 : ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다.
-- uname 칼럼에 반드시 값을 입력해야함
insert into sungjuk(sno) values(1);


-- check 제약 조건
-- ORA-02290 : 체크 제약조건 (SYSTEM.SYS_C007025)이 위배되었습니다.
insert into sungjuk (sno, uname, kor, eng, mat)
values(1, '홍길동', -10, 20, 300);

-- ORA-02290 : 체크 제약조건 (SYSTEM.SYS_C007025)이 위배되었습니다.
-- addr 칼럼에 'incheon' 허용 안 함
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, '홍길동', 10, 20, 30, 'incheon');


-- default 제약조건
-- tot과 aver에는 0 입력, wdate는 현재 날짜가 입력됨
insert into sungjuk (sno, uname, kor, eng, mat, addr)
values (2, '무궁화', 10, 20, 30, 'Seoul');

select * from sungjuk;

-- 칼럼 갯수와 값 갯수가 일치하지 않는 경우
-- SQL 오류: ORA-00913: too many values
-- 00913. 00000 -  "too many values"
insert into sungjuk (sno, uname, kor, eng, mat)
values (2, '무궁화', 10, 20, 30, 'Seoul');