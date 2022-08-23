20220823_01��������.sql

�� [��������]
    - SQL�� �� �� �ٸ� SQL��
    - ���̺� ������ �ٽ� �ѹ� �������� ���� ���ڵ� ��ȸ �� �˻�
    
-- ���������� ����� ��ȸ�Ͻÿ�
select kor from sungjuk;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk; -- 66
select round(avg(kor), 0) as avg_kor from sungjuk;


-- ��1) ���� ���� ���(66)���� ���� ���� ������ ��ȸ�Ͻÿ�

select uname, kor from sungjuk where kor >= 66;

select uname, kor from sungjuk where kor >= (select round(avg(kor), 0) from sungjuk);


-- ���� ������ �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�

-- ���� ������ �������� ����� ���Ͻÿ�
select round(avg(kor), 0)
from sungjuk
where addr = 'Seoul'; -- 73

select addr, uname, kor
from sungjuk
where kor >= 73;

select addr, uname, kor
from sungjuk
where kor >= (select round(avg(kor), 0) from sungjuk where addr = 'Seoul');

-- ��3)���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�
select addr, uname, kor
from sungjuk
where kor >= (select round(avg(kor), 0) from sungjuk where addr = 'Seoul') and addr != 'Seoul';

-- ��4)���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
select min(kor) from sungjuk;

select uname, eng, mat
from sungjuk
where eng <= (select min(kor) from sungjuk) or mat <= (select min(kor) from sungjuk);