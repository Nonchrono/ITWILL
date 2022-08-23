1. ���� �Լ�

max(column) - �ִ밪�� ���ϴ� �Լ� ex) select max(sal) from emp => 1600
min(column) - �ּҰ��� ���ϴ� �Լ� ex) select min(sal) from emp => 800

avg(column) - ��հ��� ���ϴ� �Լ� ex) select avg(sal) frop emp => 1200
sum(column) - �հ踦 ���ϴ� �Լ�   ex) select sum(sal) from emp => 3600

count(*) - �� ���ڵ� ���� ���� �Լ�, null���� ���� ex) select count(*) from emp => 3
count(�÷���) - �÷����� �������� �� ���ڵ� ���� ���� �Լ�, null���� ���� ex) select count(comm) from emp =>2
 

 
2. ���ڿ� �Լ�

lower('Hello World')       -  hello world, �ش� �÷��� ���� �ҹ��ڷ� ��ȯ�ϴ� �Լ�
upper('Hello World')       - HELLO WORLD, �ش� �÷��� ���� �빮�ڷ� ��ȯ�ϴ� �Լ�
inicap('go go go!')        - Go Go Go!, ù���ڿ� �������� ù���ڴ� �빮�ڷ� ��ȯ�ϴ� �Լ�
concat('Helllo', 'World')  - Hello World, �� ���� ���ڿ��� �����ϴ� �Լ�
substr('HelloWorld', 6)    - World, ���ڿ��� 6��°�ڸ����� ��ü�� ����
substr('HelloWorld', 1, 5) - Hello, ���ڿ��� 1��°�ڸ����� 5�ڱ��� �����ϴ� �Լ�
length('oracle')           - 6, ���ڿ��� �� ���̸� ���� �Լ�
instr('HelloWorld', 'W')   - 6, ���ڿ����� Ư�������� ��ġ�� ���� �Լ�,���� Ư�����ڰ� ���ڿ��� ���ٸ� 0 ��ȯ
lpad('SQLPLUS', 10, '*')   - ***SQLPLUS, �������� �ش���̿� ������ �κ��� Ư�����ڷ� ä��� �Լ�
rpad('SQLPLUS', 10, '*')   - SQLPLUS***, �������� �ش���̿� ������ �κ��� Ư�����ڷ� ä��� �Լ�
trim(' SQLPLUS')           - SQLPLUS, ������ �����ϴ� �Լ�
ltrim('*SQLPLUS', '*')     - SQLPLUS, �������� ���ڿ����� �ش� ���ڸ� �����ϴ� �Լ�
rtrim('SQLPLUS*', '*')     - SQLPLUS, �������� ���ڿ����� �ش� ���ڸ� �����ϴ� �Լ�
replace('SEVLTL', 'L', 'EN') - SEVENTEN, ���ڿ����� �ش� ���ڸ� �ٸ� ���ڷ� �ٲپ��ִ� �Լ�
nvl(expr1, expr2)            - expr1�� null�̸� expr2 ������ ��ȯ�ϴ� �Լ�
nvl2(expr1, expr2, expr3)    - expr1�� null1�� ���� null�� �ƴϸ� expr2, null�̸� expr3�� ��ȯ�ϴ� �Լ�
nullif(expr1, expr2)         - expr1�� expr2�� ���Ͽ� ������ null, �ٸ��� expr1�� ��ȯ�ϴ� �Լ�
coalesce(expr1, expr2, ... exprn) - expr1~exprn ��Ͽ��� ù��°�� null�� �ƴ� expr�� ��ȯ
 


3. ���� �Լ�

abs(-7)           - 7, ���밪�� ����ϴ� �Լ�
mod(1500, 200)    - 100, 1500 / 200 �� �������� ��ȯ�ϴ� �Լ�
ceil(1.123)       - 2
ceil(-1.623)      - -1, �Ҽ��� ù°�ڸ����� �ش� ���� �ø� ó���� ������ ��ȯ�ϰ� �ش� �����ٴ� ũ���� ���� �����ϴ� �ּҰ��� ���ϴ� �Լ�
floor(1.123)      - 1
floor(-1.123)     - -2, �Ҽ��� ù°�ڸ����� �ش� ���� ���� ó���� ������ ��ȯ�ϰ� �ش� �����ٴ� ������ ���� �����ϴ� �ִ밪�� ���ϴ� �Լ�
round(17.825, 2)  - 17.86
round(17.825, 1)  - 17.8
round(17.825, 0)  - 18
round(17.825, -1) - 20
round(17.825,-2)  - 0
round(n, m)       - �ش� ����n��m�ڸ����� �ݿø��ϴ� �Լ�
trunc(17.825, 2)  - 17.82
trunc(17.825, 1)  - 17.8
trunc(17.825, 0)  - 17
trunc(17.825, -1) - 10
trunc(17.825, -2) - 0
trunc(n. m)       - �ش� ���� n���� m�ڸ����� �����ϴ� �Լ�

 

4. ��¥ �Լ�

sysdate                     - ���� ��¥, �ð� ex) select sysdate from dual; - 14/03/24
months_between(sysdate, to_date('2014-12-11')) - -8.5659965,
months_between(to_date('2014-12-11'), sysdate) - 8.56597409, ù��° ��¥���� �ι�° ��¥ ���� ���� ���� ��ȯ�ϴ� �Լ�
add_months(sysdate, 5)      - 14/08/24
add_months(sysdate, -5)     - 13/10/24, �ش� ��¥���� ���� ���� ���� ��¥�� ��ȯ�ϴ� �Լ�
next_day(sysdate, '�ݿ���') - 14/03/28, �ش� ��¥���� ���ʷ� �����ϴ� �ش� ������ ��¥�� ��ȯ�ϴ� �Լ�
last_day(sysdate)           - 14/03/31, �ش� ��¥�� ���ԵǾ� �ִ� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
 


5. ����ȯ �Լ�

TO_CHAR(���� ��¥, '���ϴ� ���') - ���ڿ� ��¥�� ���ڷ� ��ȯ�� �ִ� �ΰ��� ���

TO_NUMBER('1')

TO_DATE('����','��¥����')