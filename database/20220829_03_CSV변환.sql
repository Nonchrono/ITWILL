20220829_03CSV��ȯ.sql

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

�� [CSV ����]
    - ��� �����Ͱ� , �� ���еǾ� �ִ� ����
    
�� [CSV ������ �����ͺ��̽��� ��������]
    - �������������� https://data.go.kr/ Ȱ��
    
��) ���θ� �����ȣ ���̺� �����ϱ�              

-- 1) zipdoro.csv �غ� (258267��)

-- 2) zipdoro.csv ������ �����ϴ� zipdoro ���̺��� ����
create table zipdoro (
    zipno           char(5)             -- �����ȣ
    ,zipaddress   varchar(1000)    -- �ּ�
);

commit;

drop table zipdoro;
select * from zipdoro;

-- 3) ��������� ��������
-   zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
-   zipdoro ���̺� ��Ŭ�� -> export          (��������)


select count(*) from zipdoro; -- ��ü �� ���� ��ȸ�ϱ�





-- ����Ư���� �������� ���۵Ǵ� �����ȣ�� ����� Ȯ���Ͻÿ�

select count(*)
from zipdoro
where zipaddress like ('����Ư���� ������%');


//////////////////////////////////////////////////////////////////////////////////////////////

-- ��2) �ѱ��������б�_�ʵ��б� ��ġ.csv�� ��ȯ�Ͻÿ�


create table school (
    schid            varchar(1000)    -- �б�ID
    ,schaddress   varchar(1000)    -- �б���
    ,schlevel        varchar(1000)    -- �б��ޱ���
    ,schwhere      varchar(1000)     -- ���������θ�
    ,schcreate      varchar(1000)     -- ��������
    ,schchange     varchar(1000)     -- ��������
    ,lat                 varchar(1000)    -- ����
    ,har                varchar(1000)     -- �浵
);

select count(*) from school;
drop table school;


select * from school where schwhere is null;