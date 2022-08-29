--��1)������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

select hakno, uname, address from tb_student
where address = '����';


--��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     --���� 2��
     --���� 2��
     
select * from tb_sugang su join tb_student st on su.hakno = st.hakno;
     
select address, uname
from tb_sugang su join tb_student st
on su.hakno = st.hakno
group by address, uname;

select address || ' ' || count(*) || '��' as cnt
from (select st.hakno, address
        from tb_sugang su join tb_student st
        on su.hakno = st.hakno
        group by st.hakno, address)
group by address;

--��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     --d001 HTML   2�� 
     --d002 ���伥   1��
     --p001 OOP    2��
     

select gw.gcode, gname, count(*) || '��' as �ο�
from tb_gwamok gw join tb_sugang su
on gw.gcode = su.gcode
group by gw.gcode, gname;


--��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     --g1001  ȫ�浿  9����
     --g1002  ȫ�浿  6����
     --g1005  ���޷�  9����
     
select su.hakno, ghakjum
from tb_gwamok gw join tb_sugang su
on gw.gcode = su.gcode;

select AA.hakno, st.uname, sum(AA.ghakjum)
from (select su.hakno, ghakjum
        from tb_gwamok gw join tb_sugang su
        on gw.gcode = su.gcode) AA join tb_student st
on AA.hakno = st.hakno
group by AA.hakno, st.uname;

--��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     --g1001  p001  OOP
     --g1001  p003  JSP  
     --g1001  d001  HTML
     
select su.hakno, ssu.gcode, gw.gname
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno = 'g1001'
group by su.gcode, gw.gname, su.hakno;

    
-- ��6)������û�� �� �л����� �й�, �̸� ��ȸ

select su.hakno, uname
from tb_sugang su join tb_student st
on su.hakno = st.hakno
group by su.hakno, uname;



-- ��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ

select * from tb_sugang;

select st.hakno, st.uname
from tb_student st left join tb_sugang su
on su.hakno = st.hakno
where su.hakno is null;


                            
-- ��8) daum�̸����� ���� �л��� ������ ������ �����ΰ���?


select uname, email, sum(ghakjum) || '��'  as ����
from tb_student st join tb_sugang su
on st.hakno = su.hakno join tb_gwamok gw
on su.gcode = gw.gcode
where email like '%daum%'
group by uname, email;


-- ��9) ���������� �ϰ��ִ� �л����� �����ΰ���? 


select gname, uname  
from tb_student st join tb_sugang su
on st.hakno = su.hakno join tb_gwamok gw
on su.gcode = gw.gcode
group by uname, gname
having count (uname) >= 2;