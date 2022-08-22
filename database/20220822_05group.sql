�� [������ �׷�ȭ]

-- sungjuk_seq ������ ����
drop sequence sungjuk_seq;

-- sungjuk ���̺��� ����� ������ ����
create sequence sungjuk_seq;

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk(
    sno      int              primary key     -- �⺻Ű(���ϼ�). �ߺ� ��� x
    ,uname varchar(50) not null
    ,kor      int              check(kor between 0 and 100) -- ���� ���� 0 - 100 ���̸� �Է� ����
    ,eng      int              check(eng between 0 and 100) -- ���� ���� 0 - 100 ���̸� �Է� ����
    ,mat      int              check(mat between 0 and 100) -- ���� ���� 0 - 100 ���̸� �Է� ����
    ,addr     varchar(20)  check(addr in ('Seoul','Jeju','Busan','Suwon')) -- �ּҸ� ��� �װ��� ���÷� ����
    ,tot        int              default 0
    ,aver     int              default 0
    ,wdate  date            default sysdate                       -- ���� ��¥ �Լ�
);

select * from sungjuk;

�� [sungjuk ���̺� �Է� ������]
�� ���� : d:\java202207\database\20220822_03�������̺�.sql

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'�ֵ���ũ', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);

select * from sungjuk;
select count(*) from sungjuk;
commit;

//////////////////////////////////////////////////////////////////////////////////////////////////

�� [distinct]
    - Į���� �ߺ������� ������ ��ǥ�� 1���� ���
    - ����) distinct Į����
    
select addr
from sungjuk
order by addr;
    
select addr
from sungjuk
order by addr asc; -- asc ���� ����

select addr
from sungjuk
order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;


�� [group by]
    - Į���� ���� ���볢�� �׷�ȭ ��Ŵ
    - ����) group by Į��1, Į��2, Į��3, ~~
    
-- �ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr     -- �׷�ȭ��Ű�� ���� �� �ִ� ���� 1���� ǥ�� ������ ���� ��ȸ
from sungjuk
group by addr; -- distinct�� ����


select addr from sungjuk order by addr;


-- ��1) �ּҺ� �ο����� ��ȸ�Ͻÿ�

select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt -- Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt
from sungjuk
group by addr;


-- �ּҺ� �������� �����ؼ� ��ȸ
select addr, count(*) cnt
from sungjuk
group by addr
order by addr;

-- �ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt   -- �ؼ� ���� 3)
from sungjuk                        -- �ؼ� ���� 1)
group by addr                       -- �ؼ� ���� 2)
order by cnt desc;                 -- �ؼ� ���� 4)
////////////////////////////////////////////////////////////////////////////////////////////////

�� [���� �Լ�]

-- ��2) �ּҺ� ���� ������ ���ؼ� �����Ͻÿ�
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)    -- ����, �ִ밪, �ּҰ�, �հ�, ���
from sungjuk
group by addr

-- �ּҼ����� ����
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)
from sungjuk
group by addr
order by addr;

-- round (��, 0) �Ҽ��� ���ϰ����� �ݿø��ϰ� �Ҽ����� ����
-- round (��, 2) ��� �ߴٸ� �Ҽ��� ��°�ڸ����� �ݿø��� ���� ��
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0) 
from sungjuk
group by addr
order by addr;

-- ���� ����� �Ҽ��� ���� �ݿø��ϰ� ������������ �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)  
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

-- Į���� �ο�
select addr
        , count(*) as cnt
        , max(kor) as max_kor
        , min(kor) as min_kor
        , sum(kor) as sum_kor
        , round(avg(kor), 0) as avg_kor  
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

--��3) ����(tot), ���(aver) ���Ͻÿ�

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
select * from sungjuk;

--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��������� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
where aver >= 80
group by addr
order by count(*);

commit;
