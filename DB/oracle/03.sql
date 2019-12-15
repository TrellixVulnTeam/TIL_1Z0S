-- select * + from  + where  + order by

-- ����ǥ����

select * from emp where regexp_like(ename,'[A-D]');
select * from emp where regexp_like(ename,'A|B|C|D');
select * from emp where regexp_like(ename,'^[A-D]');
select * from emp where regexp_like(ename,'[A-D]$');

-- where ������ null

select * from emp where comm is null;
select * from emp where comm is not null;


select ename,sal,comm,sal+nvl(comm,0) as total from emp;

-- �ѱ޿��� 2000�̻��� ���

select ename,sal,comm,sal+nvl(comm,0) as total from emp 
where sal+nvl(comm,0)>2000;

-- ���� , �������� �⺻

select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by deptno;
-- ��������
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by deptno DESC;

-- order by �������� �ݾ׿� ���� ���� ��
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by total;

-- �ټ���°��
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by 5;

select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
order by deptno desc,total;

select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
where deptno=10 order by total;

-- or���� in(a,b) -> a or b, 2���� ǥ��
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
where deptno in(10,20) order by total;


select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
where deptno = any(10,20) order by total;

-- deptno�� 10 and20 ��ΰ� �ƴ� -> 2���� ǥ��
select deptno,ename,sal,comm,sal+nvl(comm,0) as total 
from emp where deptno <> all(10,20) order by total;

select deptno,ename,sal,comm,sal+nvl(comm,0) as total 
from emp where deptno != all(10,20) order by total;

-- ������ �Լ� 
select * from dept;
select dname,dname,loc, loc from dept;

select dname,lower(dname),loc, lower(loc) from dept;

select round(45.357,2),trunc(45.357,2) from dept;

select sysdate,sysdate+30 from dual;
--�⵵ ���� �̾Ƴ��� --> hire date�� index(1,2)���� ���
select ename,hiredate,substr(hiredate,1,2) from emp;

select sysdate,to_char(sysdate,'YYYY') from dual;
select sysdate,to_char(sysdate,'YY') from dual;
select sysdate,to_char(sysdate,'day') from dual;
select sysdate,to_char(sysdate,'mm') from dual;



-- emp���� ������� �Ի���� ����غ�����


select ename,hiredate,to_char(hiredate,'mm') as "�Ի��� ��" from emp;
select ename,hiredate,to_char(hiredate,'mm') as "�Ի��� ��" from emp order by "�Ի��� ��";

select sysdate,to_date('2019/12/10') from dual;
select sysdate,to_date('2019_12_10') from dual;
select sysdate,to_date('2019 12 10') from dual;
select sysdate,to_date('12/05/2019') from dual; -- ��� ������
select sysdate,to_date('12/05/2019','mm/dd/yy') from dual; 


select ename,nvl(to_char(comm),'_') from emp;


-- decode �Լ�

select ename,sal,deptno,sal*1.2 from emp;
select ename,sal,deptno,sal*1.2  from emp where deptno=20;
select ename,sal,deptno,sal*1.3  from emp where deptno=30;


select ename,sal,deptno, decode(deptno, 10,sal*1.2 ,20,sal*1.3,30,sal*1.4) 
as increase_salary  from emp order by deptno ;



