-- ��� ���� ����������
-- �ڽ��� ���� �μ��� ��� �޿��� ���� ��� ����Ʈ ���


select * from emp a
where sal< (select avg(sal) from emp where deptno=a.deptno);




-- �����ϱ� ���� row_num�� ��������
select rownum,ename,job,sal,deptno from emp order by sal;
-- ���ĵǱ� ���� sort�ϱ� ����
select rownum,ename,job,sal,deptno from (select * from emp order by sal desc)

--------- pagination �� ���� --------------------
select rownum,ename,job,sal,deptno 
from (select * from emp order by sal desc)
where rownum<4;

-- �ؿ��� ���� sort �ϱ� ������ 4�̻��� ����ؼ� ������ �ʴ´�

select rownum,ename,job,sal,deptno 
from (select * from emp order by sal desc)
where rownum>4;


select rownum,ename,job,sal,deptno 
from (select * from emp order by sal desc)
where rownum between 1 and 4;

--------------------------------------------------------

select * from 
( select rownum row#, ename, job,sal,deptno)
from (select * from emp order by sal desc)
where row# between 7 and 9;


-------------------------------------------------



