�� ��������

select count(*) from tb_student; -- 6��
select count(*) from tb_sugang; -- 14��
select count(*) from tb_gwamok; -- 9��

--��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
--    (�й�, �̸�, �����ڵ�)

-- ������ ������ �����ڵ�� �����, ���� ���ϱ�
select gcode, gname, ghakjum
from tb_gwamok
where gcode like 'd%'
order by ghakjum desc;

-- �����ڵ�, �й�, ���� �հ� ���ϱ�
select su.gcode, hakno, sum(ghakjum) as hap
from tb_gwamok gw join tb_sugang su
on gw.gcode = su.gcode
where su.gcode like 'd%'
group by su.gcode, hakno
order by hap desc;

-- �ְ��� ����
select AA.gcode, AA.hakno, st.uname
from (
            select su.gcode, hakno, sum(ghakjum) as hap
            from tb_gwamok gw join tb_sugang su
            on gw.gcode = su.gcode
            where su.gcode like 'd%'
            group by su.gcode, hakno
            order by hap desc
        ) AA join tb_student st
        on AA.hakno = st.hakno
where rownum = 1;

-- max�� ������ �Ŵ� ����� �ִ�.



-- ������ �������� ���� ��ȸ�ϱ�
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

-- 1) ������ ������ �߿��� ������ ���� ���� ���� ��ȸ�ϱ�
select max(ghakjum) from tb_gwamok where gcode like 'd%';

-- 2) 1) ������� ���� ���� (5)�� ������ ������ ���� �ִ� �࿡�� �����ڵ� ����
-- ��, ������ ������ �߿��� ������ ���� ���� �����ڵ� (��, �ߺ��� ������ ���ٴ� ���� �Ͽ�)
select gcode
from tb_gwamok
where ghakjum = (5)
and gcode like 'd%';

select gcode
from tb_gwamok
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';

-- 3) 2)���� ���� �����ڵ� (d002)�� ������û�� ����� ��ȸ
select gcode, hakno from tb_sugang where gcode = ('d002');

select gcode, hakno
from tb_sugang
where gcode = (
                        select gcode
                        from tb_gwamok
                        where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
                        and gcode like 'd%'
                    );
                    
-- 4) 3)�� ����� AA ���̺�� ���� ��, �л� ���̺��� �����ؼ� �̸� ��������

select AA.gcode, AA.hakno, ST.uname
from (
            select gcode, hakno
            from tb_sugang
            where gcode = (
                                    select gcode
                                    from tb_gwamok
                                    where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
                                    and gcode like 'd%'
                                )
            ) AA join tb_student ST
on AA.hakno = ST.hakno;


-- ��ȯ�� �亯

select SU.hakno, uname, SU.gcode
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.gcode like 'd%' and ghakjum = (
                                        select max(ghakjum)
                                        from tb_gwamok
                                        where gcode like 'd%'
                                        );

                    
/////////////////////////////////////////////////////////////////////////////////////////////////////////


--��2) �й��� ������û�� �������� ���ϰ� �й��� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
--    (��, ������û���� ���� �л��� �������� 0���� ǥ��)

-- ������û �� �ؼ� null��
select st.hakno
from tb_student st left join tb_sugang su
on st.hakno = su.hakno
where su.hakno is null;

-- null�� �κ� AA�� ����
select *
from (
        select st.hakno
        from tb_student st left join tb_sugang su
        on st.hakno = su.hakno
        where su.hakno is null
        ) AA;

-- �й��� ������û ������
select st.hakno, sum(nvl(ghakjum,0))
from tb_student st full join tb_sugang su
on st.hakno = su.hakno full join tb_gwamok gw
on su.gcode = gw.gcode
where st.hakno is not null
group by st.hakno
order by st.hakno asc;

-- rownum �߰��ؼ� ���� �ο��ϱ�
select AA.hakno, AA.sum, rownum as rnum
from (
            select st.hakno, sum(nvl(ghakjum,0)) as sum
            from tb_student st full join tb_sugang su
            on st.hakno = su.hakno full join tb_gwamok gw
            on su.gcode = gw.gcode
            where st.hakno is not null
            group by st.hakno
            order by st.hakno asc
        ) AA;

-- rownum ������ �־ 4~6�� �߷�����
select BB.hakno, BB.sum, rnum
      from  (
        select AA.hakno, AA.sum, rownum as rnum
        from (
                    select st.hakno, sum(nvl(ghakjum,0)) as sum
                    from tb_student st full join tb_sugang su
                    on st.hakno = su.hakno full join tb_gwamok gw
                    on su.gcode = gw.gcode
                    where st.hakno is not null
                    group by st.hakno
                    order by st.hakno asc
                ) AA
        ) BB
where rnum >= 4 and rnum <= 6;


-- left �������� �ٽ� Ǯ��
select BB.hakno, BB.sum, rnum
      from  (
        select AA.hakno, AA.sum, rownum as rnum
        from (
                    select st.hakno, sum(nvl(ghakjum,0)) as sum
                    from tb_student st left join tb_sugang su
                    on st.hakno = su.hakno left join tb_gwamok gw
                    on su.gcode = gw.gcode
                    group by st.hakno
                    order by st.hakno asc
                ) AA
        ) BB
where rnum >= 4 and rnum <= 6;




-- �л� ���̺� ��ȸ�ϱ�
select hakno, uname from tb_student order by hakno;

-- 1) ������û�� ������ ������ ��������
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang SU join tb_gwamok GW
on su.gcode = gw.gcode;

-- 2) �й����� �������� ���϶�
select su.hakno, sum(gw.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on su.gcode = gw.gcode
group by hakno
order by hakno;

-- 3) ������û���� ���� �л��鵵 ������ �� �ֵ��� �л� ���̺� left join
        -- 2) ��� (AA ���̺�)�� ����

-- �������� null�̸� 0���� �ٲٰ�, �й������� ��ȸ�ϱ�
select st.hakno, st.uname, nvl(aa.������, 0)
from tb_student st left join (
                                        select su.hakno, sum(gw.ghakjum) as ������
                                        from tb_sugang SU join tb_gwamok GW
                                        on su.gcode = gw.gcode
                                        group by hakno
                                        order by hakno
                                      ) AA
on ST.hakno = AA.hakno
order by st.hakno;

-- 5) �ٹ�ȣ �߰� (�ٹ�ȣ�� �ִ� ���¿��� ���ĵ�)
select st.hakno, st.uname, nvl(aa.������, 0), rownum as rnum
from tb_student st left join (
                                        select su.hakno, sum(gw.ghakjum) as ������
                                        from tb_sugang SU join tb_gwamok GW
                                        on su.gcode = gw.gcode
                                        group by hakno
                                        order by hakno
                                      ) AA
on ST.hakno = AA.hakno
order by st.hakno;


-- 6) 5)�� ����� ���������ϰ� ���� �ٹ�ȣ �߰��ϱ�


select bb.hakno, bb.uname, bb.������2, rownum as rnum
from (
            select st.hakno, st.uname, nvl(AA.������, 0) as ������2
            from tb_student st left join (
                                                    select su.hakno, sum(gw.ghakjum) as ������
                                                    from tb_sugang SU join tb_gwamok GW
                                                    on su.gcode = gw.gcode
                                                    group by hakno
                                                  ) AA
            on ST.hakno = AA.hakno
            order by st.hakno
        ) BB;

-- 7) 6)�� ����� ��������(CC���̺�) �ϰ� �ٹ�ȣ(rnum) 4~6 ��ȸ�ϱ�
select cc.hakno, cc.uname, cc.������2, rnum
from (select bb.hakno, bb.uname, bb.������2, rownum as rnum
        from (
                    select st.hakno, st.uname, nvl(AA.������, 0) as ������2
                    from tb_student st left join (
                                                    select su.hakno, sum(gw.ghakjum) as ������
                                                    from tb_sugang SU join tb_gwamok GW
                                                    on su.gcode = gw.gcode
                                                    group by hakno
                                                  ) AA
                    on ST.hakno = AA.hakno
                    order by st.hakno
                ) BB
            ) CC
where rnum between 4 and 6;


��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������) 
-- �������̺� ���߰� ���ּ���
-- (�������� �� ���� ���̿��� ���Ȯ���ϱⰡ ���� �ָ� �մϴ�)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;
--�������� null�̸� 0���� �ٲٰ� �й� ������ �����ϱ�


-- 1) �����ڵ尡 ��ġ�ϴ� ���� ��������
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode;

-- 2) �й����� ������ ���ϰ� ������������ �������� �����ϱ�
select su.hakno, sum(gw.ghakjum) as ������
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno
order by sum(gw.ghakjum) desc;


-- 3) 2)�� ����� AA ���̺�� �����, �л� ���̺� �����ؼ� �̸� ��������
select AA.hakno, AA.������, uname, rownum as rnum
from (
            select su.hakno, sum(gw.ghakjum) as ������
            from tb_sugang su join tb_gwamok gw
            on su.gcode = gw.gcode
            group by su.hakno
            order by sum(gw.ghakjum) desc
        ) AA join tb_student st
on AA.hakno = st.hakno;


-- 4) 3)�� ����� ���������ϰ� �ٹ�ȣ�� �̿��ؼ� ���������� 1�Ǹ� ��ȸ�ϱ�
select hakno, ������, uname
from (
            select AA.hakno, AA.������, uname, rownum as rnum
            from (
                        select su.hakno, sum(gw.ghakjum) as ������
                        from tb_sugang su join tb_gwamok gw
                        on su.gcode = gw.gcode
                        group by su.hakno
                        order by sum(gw.ghakjum) desc
                    ) AA join tb_student st
            on AA.hakno = st.hakno
        )
        where rownum = 1;



-- �й��� ������û ������
select st.hakno, sum(nvl(ghakjum,0)) as sum
from tb_student st full join tb_sugang su
on st.hakno = su.hakno full join tb_gwamok gw
on su.gcode = gw.gcode
where st.hakno is not null
group by st.hakno
order by sum desc;

-- ��ȣ ����
select hakno, hap, uname, rownum
from
    (
        select st.hakno, sum(nvl(ghakjum,0)) as hap, uname
        from tb_student st full join tb_sugang su
        on st.hakno = su.hakno full join tb_gwamok gw
        on su.gcode = gw.gcode
        where st.hakno is not null
        group by st.hakno, uname
        order by hap desc
    ) AA
where rownum = 1;