2022-08-26 01_���̺�����.sql

////////////////////////////////////////////////////////////////////////////////

�� [���̺� ����]
    - ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
    - �ΰ� �̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
    - �� ���̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����
    
    
  ����) 
            select Į����
            from  ���̺�1 join ���̺�2
            on ������;                          -- ANSI (ǥ��) SQL��
            
            select Į����
            from  ���̺�1, ���̺�2
            on ������;                          -- Oracle DB SQL��
            
            select T1.*, T2.*                 -- T1.���Į��, T2.���Į��
            from T1 join T2
            on T1.x = T2.x;                   -- ���̺��.Į����
            
            select T1.*, T2.*, T3.*
            from T1 join T2
            on T1.x = T2.x join T3          -- 3�� ���̺� ����
            on T1.y = T3.y;
            
            select T1.*, T2.*, T3.*, T4.*   -- 4�� ���̺� ����
            from T1 join T2
            on T1.x = T2.x join T3
            on T1.y = T3.y join T4
            on T1.z = T4.z;
            
�� ������ : where ������, having ������, on ������


�� ������ ���̺�� ���� ���̺��� ���� ������ �����̴�.
    - ������ ���̺� : ���� create table�� ���̺�
    - ���� ���̺� : sql���� ���ؼ� ������ ���̺�
    
select * from tb_student;
select count(*) from tb_student; -- 6
-- 6�̶�� ���� ���� �ʾ����� ���� ���̺�� ������ �����ϴ�.
-- ���� ���̺� ������ �����ϴ�

//////////////////////////////////////////////////////////////////////////////////////////////////

�� ����


-- �й��� �������� ���� ���̺�� �л� ���̺� ����            
select tb_student.*, tb_sugang.*
from tb_student join tb_sugang
on tb_student.hakno = tb_sugang.hakno;

--�л� ���̺�� ���� ���̺� ���ο��� ��ȸ
--�л��� ������ ������û�� ������ ����
--�л��� �й��� ������û�� �й��� ���� �͸�!

select * from tb_student;
select * from tb_sugang;

-- �� ���̺��� ������ ����, inner ���� ����, ���� �⺻
select tb_student.*, tb_sugang.*
from tb_student inner join tb_sugang
on tb_student.hakno = tb_sugang.hakno;


-- ������û�� �л����� �й�, �����ڵ�, �̸�, �̸��� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_student.hakno = tb_sugang.hakno;

-- �����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok 
on tb_sugang.gcode = tb_gwamok.gcode;


-- 3�� ���̺� ���� : ���� ���̺� + �л� ���̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- ���̺� ����  alias(��Ī)�� �����ϴ� (�Ͻ���)
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;


select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--3�� ����
select su.*, st.uname, st.email, gw.gname, gw.ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;


-- ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ�.
select su.*, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;

-- �ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ��Ѵ�.
-- ORA-00918 : ���� ���ǰ� �ָ��մϴ�.
select hakno, gcode, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;

-- ����
select SU.hakno, SU.gcode, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;
/////////////////////////////////////////////////////////////////////////////////////////////////////

-- ��ü �� ����
select count(*) from tb_student; -- 6��
select count(*) from tb_gwamok; -- 9��
select count(*) from tb_sugang; -- 13��

--��1)������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�


-- ������û�� �л��� ��� ����
select * from tb_sugang;

-- �������̺� + �л� ���̺�
select su.*, uname, address
from tb_student st join tb_sugang su
on st.hakno = su.hakno;

-- '����'�� ��ȸ�ϱ�
select su.*, uname, address
from tb_student st join tb_sugang su
on st.hakno = su.hakno and st.address = '����';

select su.*, uname, address
from tb_student st join tb_sugang su
on st.hakno = su.hakno
where address = '����';

-- ����
select su.hakno, su.gcode, uname, address
from tb_student st join tb_sugang su
on st.hakno = su.hakno;

-- ������ ���� ���̺��� �̸��� AA��� �����ϰ� �ٽ� �簡���� �� �ִ�.
select AA.hakno, AA.gcode, AA.uname, AA.address --AA.email
from (
         select su.hakno, su.gcode, uname, address
         from tb_student st join tb_sugang su
         on st.hakno = su.hakno
        ) AA
where AA.address = '����';

-- AA ��Ī ���� ����
select hakno, gcode, uname, address
from (
         select su.hakno, su.gcode, uname, address
         from tb_student st join tb_sugang su
         on st.hakno = su.hakno
        )
where address = '����';

-- Į������ ����� ���¿����� *�� ����! �ƹ����� *�� ���� ���߿� Ȯ���ϱ� �����
select *
from (
         select su.hakno, su.gcode, uname, address
         from tb_student st join tb_sugang su
         on st.hakno = su.hakno
        )
where address = '����';


--��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     --���� 2��
     --���� 2��
     
select st.address, count(*) as cnt
from tb_student st join tb_sugang su
on st.hakno = su.hakno
where su.hakno = st.hakno
group by st.address;

-- 1) ���� ���̺� ��ȸ
select * from tb_sugang;

-- 2) ���� ��û�� �л����� ��� (�й�)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno; -- group by ���� ���������� ������ ������ ����

-- 3) ���� ��û�� �й�(AA)���� �ּҸ� �л� ���̺��� ��������
select AA.hakno, st.address
from (
    select hakno from tb_sugang group by hakno
) AA join tb_student st
on AA.hakno = st.hakno;

-- 4) 3)�� ����� BB���̺�� ���� �� �ּҺ� �׷� �� �� ���� ���ϱ�
select BB.address, count(*) || '��' as cnt
from (select AA.hakno, st.address
        from (
                    select hakno from tb_sugang group by hakno
                ) AA join tb_student st
        on AA.hakno = st.hakno
        ) BB 
group by BB.address;

-- ���� 1)
select AA.address, count(*) || '��'
from(
    select SU.hakno, address
    from tb_sugang SU join tb_student ST
    on SU.hakno = ST.hakno
    group by SU.hakno, address
     ) AA
group by AA.address;

-- ���� 2) distinct
select ST.address, count(distinct(ST.hakno))
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;


--��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     --d001 HTML   2�� 
     --d002 ���伥   1��
     --p001 OOP    2��
     
select gw.gcode, gname, count(*) as cnt
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
group by gw.gcode, gname;

select AA.gcode, AA.gname, count(*) as cnt
from (
        select gw.gcode, gname
        from tb_sugang su join tb_gwamok gw
        on su.gcode = gw.gcode
) AA
group by AA.gcode, AA.gname ;


-- ����� Ǯ��
-- 1) ���� ���̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�
select * from tb_sugang order by gcode;

-- 2) �������̺��� �����ڵ尡 ������ ���� �׷�ȭ
select gcode, count(*)
from tb_sugang
group by gcode;

-- 3) 2)�� ����� AA ���̺�� �����ϰ� �������̺� �����ϱ�

select AA.gcode, concat(AA.cnt, '��'), GW.gname
from (
        select gcode, count(*) as cnt
        from tb_sugang
        group by gcode
) AA join tb_gwamok GW
on AA.gcode = GW.gcode
order by AA.gcode;
//////////////////////////////////////////////////////////////////////////////////////////////////////

--��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     --g1001  ȫ�浿  9����
     --g1002  ȫ�浿  6����
     --g1005  ���޷�  9����
     
     
select su.hakno, uname, sum(ghakjum) as ����
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno, uname
order by su.hakno asc;

select hakno, uname, sum(ghakjum) || '��' credit
from (
        select AA.hakno, st.uname, ghakjum
        from (
                select su.gcode, su.hakno, gname, ghakjum
                from tb_sugang su join tb_gwamok gw
                on su.gcode = gw.gcode
                ) AA join tb_student st
        on AA.hakno = st.hakno
        ) 
group by hakno, uname;

-- 1) ���� ���̺��� �й����� ��ȸ
select hakno
from tb_sugang
group by hakno;

-- 2) ���� ���̺� �����ڵ尡 ��ġ�ϴ� ������ ���� ���̺��� �����ͼ� ���̱�
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode;

-- 3) 2)�� ����� AA���̺�� ����� �й����� �׷�ȭ�� �� ������ �հ踦 ���ϱ�
select AA.hakno, sum(AA.ghakjum) as hap
from (select su.hakno, su.gcode, gw.ghakjum
        from tb_sugang su join tb_gwamok gw
        on su.gcode = gw.gcode) AA
group by AA.hakno;

-- 4) 3)�� ����� BB ���̺�� ����� �й��� �������� �л� ���̺��� �̸� �����ͼ� ���̱�
select BB.hakno, concat(BB.hap, '����'), st.uname
from (select AA.hakno, sum(AA.ghakjum) as hap
        from (
                    select su.hakno, su.gcode, gw.ghakjum
                    from tb_sugang su join tb_gwamok gw
                    on su.gcode = gw.gcode
                ) AA
        group by AA.hakno
    ) BB join tb_student st
on BB.hakno = st.hakno;

-- ��4)�� �Ǵٸ� ���
-- 1) �������̺� + �л����̺� + �������̺� 3�� ���̺� �Ѳ����� ����
select su.hakno, su.gcode, st.uname, gw.ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
order by su.hakno;

-- 2) 1�� �׷�(�й�), 2�� �׷�(�̸�)���� �׷�ȭ�ϰ� ������ ���ϱ�
select su.hakno, st.uname, sum(gw.ghakjum) || '����' as hap
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno, st.uname
order by su.hakno;

-- 2�� �׷��� �ִ� ���� : �Ƿ�Ʈ�� �����ϱ� ���϶�� 2�� �׷��� �����.


--��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     --g1001  p001  OOP
     --g1001  p003  JSP  
     --g1001  d001  HTML
     
select su.hakno, gw.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno = 'g1001';

select AA.hakno, AA.gcode, AA.gname
from (
select su.hakno, gw.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno = 'g1001'
) AA;
     
-- 1) �������̺� + �������̺� ����
select su.hakno, su.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode;

-- 2) �й� g1001�� ��û�� ���� ��ȸ�ϱ�
select su.hakno, su.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno = 'g1001'        -- ���� �ڹ��ڵ忡�� �й��� ����ó���Ѵ�.
order by su.gcode;
    
-- ��6)������û�� �� �л����� �й�, �̸� ��ȸ

select st.hakno, uname
from tb_student st join tb_sugang su
on st.hakno = su.hakno
group by st.hakno, uname;

select AA.hakno, AA.uname
from(
select st.hakno, uname
from tb_student st join tb_sugang su
on st.hakno = su.hakno
group by st.hakno, uname
) AA;

-- ���� ���̺� AA ���� SQL�� ����ϱ�
select *
from (
    select SU.hakno, uname
    from tb_sugang SU join tb_student ST
    on SU.hakno = ST.hakno join tb_gwamok GW
    on SU.gcode = GW.gcode
    ) AA
group by hakno, uname
order by hakno;

-- group by ���� ����ϱ�
select SU.hakno, uname -- count(uname) ��
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, uname
order by SU.hakno;

-- distinct
select distinct(SU.hakno), uname -- count(uname) �ȉ�
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;



-- 1) ������û�� �� �л����� �й� ��ȸ
select hakno  from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

-- 2)
select hakno, uname
from tb_student
where hakno = 'g1001' or hakno = 'g1002' or hakno = 'g1005' or hakno = 'g1006';

select hakno, uname
from tb_student
where hakno in ('g1001', 'g1002', 'g1005', 'g1006');

-- 3)
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);



-- ��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ

select * from tb_student;
select * from tb_sugang;

select st.hakno, st.uname
from tb_student st
left join tb_sugang su
on st.hakno = su.hakno
where su.hakno is null;

select hakno, uname
from tb_student
where hakno not in (
                            select st.hakno
                            from tb_student st join tb_sugang su
                            on st.hakno = su.hakno
                            );
                            
                            
-- ��8) daum�̸����� ���� �л��� ������ ������ �����ΰ���?

select * from tb_student;

select uname, email, st.hakno
from tb_student st join tb_sugang su 
on st.hakno = su.hakno join tb_gwamok gw
on su.gcode = gw.gcode
where email like '%daum%'
group by uname, email, st.hakno;

-- ��9) ���������� �ϰ��ִ� �л����� �����ΰ���? 

