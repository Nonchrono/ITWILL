�� [�ڷ���]
1) ������
    - ������   varchar(5)      'SKY' 5ĭ �Ҵ��ϸ� ����Ѹ�ŭ��, �� 3ĭ�� ����Ѵ�. ��) ���̵�, ��й�ȣ, �̸�, �ּ� --
    - ������   char(5)          'SKY' �Ҵ��Ѹ�ŭ�� �޸𸮸� ����Ѵ�.                    ��) �ֹι�ȣ, �����ȣ, ���¹�ȣ, --

2) ������
    - int ������
    
3) ��¥��
    - ����Ͻú���
    - ���б�ȣ - �� / ��ȣ�� ����Ѵ�.
    - ���ڿ� Ÿ������ �Է��Ѵ�.
    - date

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

�� [���̺� ��������]

1) primary key
    �⺻Ű. ���ϼ�. ��� ���̺��� �����̸Ӹ� Ű�� �ϳ� �̻� �����ؾ��Ѵ�.
    where �������� �ɸ� �� �ִ� ��ǥ���� Į���� ������ �� �ִ�.
    ��) �ֹι�ȣ, �ڵ��� ��ȣ, ���� ��ȣ, ���̵�, �̸��� --
    �⺻�� not null �Ӽ��� ���� �ִ�. (���� ������� ����. �ݵ�� ������ �Է��ؾ���)
    �ߺ��� ������� �ʴ´�.
    
2) not null
    ���� ������� ����
    
3) check
    �Է��� ���� Ư�� ������ �����ϴ� ����

4) default
    ����ڰ� ���� �Է����� ������ �ش� Į���� ������ �⺻���� �ڵ����� �Է����ش�.
    
5) unique
    �ߺ� ��� �� ��
    null ���� �ѹ��� ���

6) foreign key
    �ܷ�Ű
    ���̺��� �����ϴ� ��� �θ�� �ڽ� ���踦 ����

////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

[���̺� ���� ���� ���� �޼���]

-- primary key ��������
-- ORA-00001 : ���Ἲ ���� ���� (SYSTEM.SYS_C007026)�� ����˴ϴ�.
-- sno Į���� �⺻Ű(PK)������ �ߺ��� ���� ������� ����
insert into sungjuk(sno, uname) values(1, 'ȫ�浿'); -- 2�� �������� �� ���� �߻�


-- not null ���� ����
-- ORA-01400 : ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�.
-- uname Į���� �ݵ�� ���� �Է��ؾ���
insert into sungjuk(sno) values(1);


-- check ���� ����
-- ORA-02290 : üũ �������� (SYSTEM.SYS_C007025)�� ����Ǿ����ϴ�.
insert into sungjuk (sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);

-- ORA-02290 : üũ �������� (SYSTEM.SYS_C007025)�� ����Ǿ����ϴ�.
-- addr Į���� 'incheon' ��� �� ��
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'incheon');


-- default ��������
-- tot�� aver���� 0 �Է�, wdate�� ���� ��¥�� �Էµ�
insert into sungjuk (sno, uname, kor, eng, mat, addr)
values (2, '����ȭ', 10, 20, 30, 'Seoul');

select * from sungjuk;

-- Į�� ������ �� ������ ��ġ���� �ʴ� ���
-- SQL ����: ORA-00913: too many values
-- 00913. 00000 -  "too many values"
insert into sungjuk (sno, uname, kor, eng, mat)
values (2, '����ȭ', 10, 20, 30, 'Seoul');