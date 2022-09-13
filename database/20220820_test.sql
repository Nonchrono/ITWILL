select * from sungjuk;

--��1) ���������� 50���̻� ���� ��ȸ�Ͻÿ�

select uname, kor
from sungjuk
where kor >= 50;


--��2) ���� ������ 50���̸� ���� ��ȸ�Ͻÿ�

select uname, eng
from sungjuk
where 50 >= eng;


--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
where uname = '���ѹα�';


--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
where uname != '���ѹα�';


--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
where kor >= 90 and eng >= 90 and mat >= 90;


--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
where kor < 40 or eng < 40 or mat < 40;


--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
--where kor >= 80 and kor < 90;
where kor between 80 and 89;


--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
--where uname = '����ȭ' or uname = '����ȭ';
where uname in ('����ȭ','����ȭ');

-- �������� 10, 30, 50���� ��ȸ�Ͻÿ�

select uname, kor, eng, mat, tot, aver
from sungjuk
where kor = 10 or kor = 30 or kor = 50;


-- ��9) ��, ��, �� ��� 100���� �ƴ� ���� ��ȸ�Ͻÿ�





--��1) �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�



--��2) �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�





--��3) �̸��� '��'���� �ִ� �̸��� ��ȸ�Ͻÿ�




--��4) �α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�




--��5) �̸� ������ �߿��� ��� ���ڰ� '��' �ִ� ���� ��ȸ�Ͻÿ�




-- ��6) ���� + ������ �����ϰ� �˻�� '�Ľ�Ÿ'�� ��
-- �����̳� ���� �� �� �ƹ����� �Ľ�Ÿ�� ��������� �ȴ�



-- ��7) ���� ������ 50�� �̻��� �࿡ ���ؼ� ������ ����� ���Ͻÿ�



-- ��տ� ������� ���� ���� ������ ���Ͻÿ� (null�� �ƴ� ��)



-- ��� �ִ� ������ ����� ��� ���Ͻÿ�

