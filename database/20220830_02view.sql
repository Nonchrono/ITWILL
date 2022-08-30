
�� [�� View]


1) ����
  - ���̺�ó�� ����ϴ� ��
  - ���̺� ���� ������ ���̺�ν� ���̺�ó�� ���� �����͸� �������� �ʰ�
    �˻��ÿ� �̿��� �� �ֵ��� ������ ��� �ִ� ��ü ���̺� ������ �κ�����
    
2) ������
  - ���̺� ���� ���ȱ���� �����ؾ� �ϴ� ���
  - �����ϰ�, ���� ����ϴ� ���� SQL���� ���� ���� �����ϰ� ����ؾ� �ϴ� ���
  -- ���±����� sys ������ ������ ��� ������ �־ ���������� ���ο� ������ ���� ������ �ο��ؾ��Ѵ�.
  
3) java202207 ������ ���ؼ� �� ���� ���� �ο�
  - grant create view to java202207
  
4) �� ���� �� ���� ����
   create or replace view ���̸�   -> replace : �̹� �����ϴ� ���� ������ ������
   as [SQL��]
   -- ��ó���� create�ε� �������� ����ϸ� replace�� ����� �� �ִ�.
   
5) �� ���� �ϱ�
   drop view ���̸�
   
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
-- ���̺�, �� ��� Ȯ��
select * from tab;                                  -- ��� ��ü ���� Ȯ��
select * from tab where tabtype='TABLE'; -- ���̺� ���
select * from tab where tabtype='VIEW';   -- �� ���


-- sungjuk ���̺� ��� Ȯ��
select * from sungjuk;

-- �ּҰ� ����, ���� ������ �̸�, ��, ��, ��, �ּҸ� ��ȸ�Ͻÿ�
select  uname, kor, eng, mat, addr
from sungjuk
-- where addr = 'Seoul' or addr = 'Jeju';
where addr in ('Seoul', 'Jeju');

-- �� ���� (�ι�°���ʹ� ����)
-- ����) create or replace view ���̸� as ������ ������ sql��

create or replace view test1_view
as
        select  uname, kor, eng, mat, addr
        from sungjuk
        where addr in ('Seoul', 'Jeju');
        
-- ��Ͽ��� �� ��ȸ
select * from tab where tabtype='VIEW';

-- �� ����
drop view test1_view;

-- ������ ��� ���̺�ó�� ��� �����ϴ�
select * from test1_view;

-- ������ ���� (user_view ���̺�)���� ���� ���� ���� Ȯ��
select * from user_views;
select text from user_views where view_name='TEST1_VIEW';


-- test2_view ���� (alias ��Ī)
create or replace view test2_view
as
        select  uname as �̸�, kor as ����, eng as ����, mat as ����, addr as �ּ�
        from sungjuk
        where addr in ('Seoul', 'Jeju');
        
select * from test2_view;



-- ��) ������û�� �л����� �й�, �������� ��� �����Ͻÿ� (test3_view)
--      g1001   14����
--      g1002   8����
--      g1005   12����
--      g1006   3����

-- 1) ������û�� �л����� �й�, ������
select su.hakno as �й�, sum(gw.ghakjum) || '����' as ������
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno
order by su.hakno;

-- 2) �� ����
create or replace view test3_view
as
        select su.hakno as �й�, sum(gw.ghakjum) || '����' as ������
        from tb_sugang su join tb_gwamok gw
        on su.gcode = gw.gcode
        group by su.hakno
        order by su.hakno;
        
--create or replace view test4_view
--as
--        select su.hakno, sum(gw.ghakjum)
--        from tb_sugang su join tb_gwamok gw
--        on su.gcode = gw.gcode
--        group by su.hakno
--        order by su.hakno;
                
-- ��� Ȯ��
select * from test3_view;


-- 3) 2)�� ��� �л� ���̺��� �����ؼ� �й�, �̸�, ������ ����ϱ�
select tb_student.uname, test3_view.*
from tb_student join test3_view
on tb_student.hakno = test3_view.�й�
order by tb_student.hakno;