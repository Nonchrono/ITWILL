���� -> ���θ���� -> �����ͺ��̽����� -> �����ͺ��̽� ����
d:\java202207\databas20220819_02SQL����.sql
///////////////////////////////////////////////////////////////////////////////////////

[sungjuk ���̺� ����]
drop table sungjuk;

[sungjuk ���̺� ����]
create table sungjuk(
        uname varchar (50) not null -- ���� ������� ����. 
                                                -- ������ 50���� �̳����� �Է�
                                                -- �ѱ��� ��� ���� ����ȯ�濡 ���� �ٸ����� 3ĭ�� ��ƸԴ´�. 16���� �̳� �Է�
        ,kor  int                  not null
        ,eng int                  not null
        ,mat int                  not null
        ,tot   int                  null       -- �� ���
        ,aver int                             -- null ���� ����
);

[���� ������ ���߰�]
insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('������',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',100,100,100);
///////////////////////////////////////////////////////////////////////

[��ü ���ڵ� ��ȸ]
select uname, kor, eng, mat, tot, aver from sungjuk;

[��ü �హ�� ��ȸ]
select count(*) from sungjuk;

[select ��ȸ �� �˻�]
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk; -- ��ü ��� Į�� ��ȸ

[as] -- Į������ �ӽ� ����
select kor as korea, eng as english, mat as mate
from sungjuk;

-- as�� ���� ����
select kor korea, eng english, mat mate
from sungjuk;

select uname as �̸�, kor as ����, eng as ����, mat as ����, tot ����, aver ���
from sungjuk;
-- �ѱ��� ���������θ� ���� �ǹ����� ���� �� ����
-- �ӽ� �ѱ� Į������ �ǽ������� �м��ؾ��ϴ� ��쿡�� ��õ


[count �Լ�] - �� ���� ��ȸ
select count(uname) from sungjuk;
select count(kor) from sungjuk;
select count(eng) as cnt_eng from sungjuk;
select count(mat) ���а��� from sungjuk; -- �ӽ� Į�������� �ѱ� ����

-- null ���� ī��Ʈ���� �ʴ´�.
select count(tot) from sungjuk; -- 0
select count(aver) from sungjuk; -- 0

-- sungjuk ���̺��� ��ü �� ����
select count(*) from sungjuk;
select count(*) as ��ü�హ�� from sungjuk;
select count(*) ��ü�హ�� from sungjuk;
////////////////////////////////////////////////////////////////////////////



[��ɾ� �Ϸ�� ���]
- insert, update, delete ��ɾ ����ϴ� ���, ��ɾ� ��ҿ� ��ɾ� �ϷḦ ������ �� �ִ�.
- commit    : ��ɾ� �Ϸ�
- rollback   : ��ɾ� ���

-- ���� select ó�� ��ȸ�� �ϸ� �ϷḦ ���� �ʿ䰡 ������ insert, update, delete ���� ��ȭ�� �ָ� ��ɾ� �Ϸᳪ ��Ҹ� �ؾ��Ѵ�.

delete from sungjuk; -- ��ü ���ڵ� ����
select * from sungjuk; -- ��ü ���ڵ� ��ȸ

rollback;       -- ��ɾ� ���
commit;        -- ��ɾ� �Ϸ�