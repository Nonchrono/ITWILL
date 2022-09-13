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

-- ����ִ� ��(null)�� ã���ÿ�


create table school (
        schoolid            varchar(10)       -- �б�ID
    ,   schoolname       varchar(255)      -- �б���
    ,   schoolgubun      varchar(20)        -- �б��ޱ���
    ,   schooladdr         varchar(255)      -- ����������s��
    ,   cdate                date                  -- �������� (���� YYYY-MM-DD)
    ,   udate                date                  -- �������� (���� YYYY-MM-DD)
    ,   latitude              number(20,9)     -- ����
    ,   longitude            number(20,9)     -- �浵
);

select count(*) from school;
drop table school;


select * from school
where schoolid is null
or schoolname is null
or schoolgubun is null
or schooladdr is null
or cdate is null
or udate is null
or latitude is null
or longitude is null;

-- ����) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�

-- �ʵ��б�, ���б� ����
select *
from school
where schoolgubun = '�ʵ��б�' or schoolgubun = '���б�';

-- ���� �ڸ���
select substr(schooladdr, 0, 2)
from school;

-- �׷�ȭ
select substr(schooladdr, 0, 2) as ����, schoolgubun, count(substr(schooladdr, 0, 2)) cnt
from school
where schoolgubun = '�ʵ��б�' or schoolgubun = '���б�' and schooladdr is not null
group by substr(schooladdr, 0, 2), schoolgubun;

-- ���̴��� �亯 (���ڿ� ���� ã�Ƽ� �غ���)
select substr(schooladdr, 0, instr(schooladdr, ' ', 1)) , schoolgubun, count(*)
from school
group by substr(schooladdr, 0, instr(schooladdr, ' ', 1)), schoolgubun
having schoolgubun <>'����б�'
order by substr(schooladdr, 0, instr(schooladdr, ' ', 1)), schoolgubun desc;

-- ��ȯ�� �亯
select
     nvl(cho.addr1, '-')
    ,nvl(cho.ckinds, '�ʵ��б�') as �б�����
    ,nvl(cho.c_cnt, 0) as ����
    ,nvl(jung.addr2, '-')
    ,nvl(jung.jkinds, '���б�') as �б�����
    ,nvl(jung.j_cnt, 0) as ����
from(
    select addr1, ckinds, count(*) as c_cnt
    from (
        select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr1, schoolgubun as ckinds
        from school
        )
    group by addr1, ckinds
    having ckinds like '��%'
    ) cho full join (
                select addr2, jkinds, count(*) as j_cnt
                from (
                    select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr2, schoolgubun as jkinds
                    from school
                    )
                group by addr2, jkinds
                having jkinds like '��%'
                ) jung
on cho.addr1 = jung.addr2
order by cho.addr1;