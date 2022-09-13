-- 20220823_02����Ŭ�Լ�.sql

�� [����Ŭ �Լ�]

1. ���ڿ� �Լ�

-- ���� ���̺� : dual (�ӽ� ���� ���� ����)

select lower('Hello World') from dual;           -- ���� �ҹ��ڷ� ��ȯ
select upper('Hello World') from dual;           -- ���� �빮�ڷ� ��ȯ
select length('Hello World') from dual;          -- ���� ����
select substr('Hello World', 1, 5) from dual;   -- ���ڿ� �ڸ��� 

select instr('Hello World', 'W') from dual;      -- Ư�� ���� ��ġ
select lpad('SKY', 5, '*') from dual;              -- 5ĭ ������ ����ϰ� ���� ��ĭ�� *�� ä��
select rpad('SKY', 5, '*') from dual;              -- 5ĭ ������ ����ϰ� ������ ��ĭ�� *�� ä��
select replace('happy', 'p', 'k') from dual;     -- Ư������ ��ȯ

select chr(65) from dual;   -- ASCII ���� ��ȯ A
select chr(66) from dual;   -- B
select chr(97) from dual;   -- a
select chr(98) from dual;   -- b

-- ���ڿ� �����ϱ�
select concat('�ι̿�','�ٸ���') from dual;   -- �ι̿��ٸ���

-- concat(Į����, '���ڿ�')
select concat(uname, '�� �����'), concat(aver, ' �Դϴ�') from sungjuk;  

-- || ���տ�����
select uname || '�� ����� ' || aver || ' �Դϴ�.' from sungjuk;

select uname || '�� ����� ' || aver || ' �Դϴ�.' as str from sungjuk;
//////////////////////////////////////////////////////////////////////////////////////////////////////

2. ���� ���� �Լ�

select abs(-7) from dual;           -- ���밪
select mod(5, 3) from dual;        -- ������ ������
select ceil(12.4) from dual;         -- 13
select trunc(13.56, 1) from dual;  -- 13.5

select avg(kor) from sungjuk;               -- 66.363636...
select ceil(avg(kor)) from sungjuk;        -- 67
select trunc(avg(kor), 2) from sungjuk;  -- 66.36


-- to_number('���� ������ ���ڿ�')
select to_number('123')+1 from dual; -- 124
select '100'+1 from dual;                  -- 101 ���������� to_number()�� ȣ���

////////////////////////////////////////////////////////////////////////////////////////////

3. ��¥ ���� �Լ�

select sysdate from dual; -- �ý����� ���� ��¥�� �ð� ������ �����ϴ� �Լ�

-- sysdate���� ����� �����ϱ�
select extract (year from sysdate) from dual;       -- 2022
select extract (month from sysdate) from dual;    -- 8
select extract (day from sysdate) from dual;        -- 23

-- ��¥ �������� ����
select sysdate+100 from dual;           -- ���� ��¥ + 100��
select sysdate-100 from dual;           -- ���� ��¥ - 100��

-- �ΰ��� ��¥ �����Ϳ��� ���� �� ���
select months_between('2022-08-23','2022-05-25') from dual;     -- 2.93 ...
select months_between('2022-08-23','2022-12-25') from dual;     -- -4.06 ...


-- ���ڿ��� ��¥������ ��ȯ
select to_date('2022-10-25') from dual;
select to_date('2022-10-25') - to_date('2022-10-30') from dual;       -- 5


////////////////////////////////////////////////////////////////////////////////////////////////


�� nvl() �Լ�
-- null ���� �ٸ� ������ �ٲ�
-- mariadb������ ���� �Լ��� ifnull()�� �ִ�.

-- ����) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�

select max(kor), count(*)
from sungjuk
where addr = 'Incheon';

select max(kor), count(*)
from sungjuk
where addr = 'Incheon' and kor = (select max(kor) from sungjuk);     -- �ִ밪 (null), �ο� �� (0)

select max(kor), count(*)
from sungjuk
where addr = 'Seoul' and kor = (select max(kor) from sungjuk);

select count(*) + 1             
from sungjuk
where addr = 'Incheon';
-- 0 + 1 -> 1

select max(kor) + 1             
from sungjuk
where addr = 'Incheon';
-- null + 1 -> null���� ������ �� ����

select nvl(max(kor), 0)
from sungjuk
where addr = 'Incheon';
-- null ���̸� 0���� ��ü��

select nvl(max(kor), 0) + 1 as max_kor
from sungjuk
where addr = 'Incheon';


///////////////////////////////////////////////////////////////////////////////////////////


�� ����Į��
-- Į�� : ���̺��� �����ϴ� ��ĭ. ���� ������ �����ͳ��� ������� ��.
    - rownum : ���ȣ
    - rowid     : ���� �ּҰ� (�� �� ��)

select sno, uname, addr, rownum, rowid
from sungjuk;

select sno, uname, addr, rownum
from sungjuk
where rownum >= 1 and rownum <= 5;

select sno, uname, addr, rownum
from sungjuk
where addr = 'Seoul';

-- �ڽ��� ���ȣ�� �����ؼ� ���ĵ�. rownum�� �߰��ϴ� ������ ����ؾ���
select sno, uname, addr, rownum
from sungjuk
order by uname;