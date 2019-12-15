-- join

-- iner join

select ename,deptno from emp where ename='SMITH';
select * from dept where deptno=20 ;
select ename,dname,loc from emp,dept ;
select ename,dept.deptno,dname,loc from emp,dept  where emp.deptno=dept.deptno;

-- ��Ī ���
select ename,d.deptno,dname,loc from emp e,dept d  
where e.deptno=d.deptno;

-- ansi join ǥ�� ,=> join
-- where =>on

select ename, d.deptno,dname,loc from emp e join dept d  
on e.deptno=d.deptno;


select ename, d.deptno,sal,comm,sal+nvl(comm,0) as total from emp e join dept d
on e.deptno=d.deptno where sal+nvl(comm,0)>2000;


select ename, d.deptno,sal,comm,sal+nvl(comm,0) as total from emp e inner join dept d
on e.deptno=d.deptno where sal+nvl(comm,0)>2000;



-- outer join
-- null�� �ִ� ���� �÷��� ��ŷ �ؾ��Ѵ�

select ename,dept.deptno,dname,loc from emp,dept  
where emp.deptno(+)=dept.deptno;

--
select ename,dept.deptno,dname,loc from emp,dept  
where emp.deptno=dept.deptno(+);


select ename,dept.deptno,dname,loc from emp right outer join dept  
on emp.deptno=dept.deptno;



select ename,d.deptno,dname,loc from emp e left outer join dept d  
on e.deptno=d.deptno;



-- non equi join 


select * from salgrade;

select ename,job,sal,salgrade.grade from emp, salgrade 
where sal between losal and hisal ;


select ename,job,sal,salgrade.grade from emp join salgrade 
on sal between losal and hisal ;

--------------------
----������ ���̺� ����----
---------------------

-- ���̺��� n ->���� :n-1
select ename, job, dname,loc,sal,grade 
from emp ,dept,salgrade 
where emp.deptno=dept.deptno 
      and 
      sal between losal and hisal ;


-- �Ƚ� ����
select ename, job, dname,loc,sal,grade 
from emp 
     join dept  
     on emp.deptno=dept.deptno 
     join salgrade 
     on sal between losal and hisal 
     where sal>3000;

      
select lower(e.ename), lower(m.ename) as "����"
from emp e, emp m 
where e.mgr = m.empno;



-- oracle ���---��纸�� �޿��� ���� ����� ����ض�

select lower(e.ename), lower(m.ename) as "����",e.sal as "e�� sal",m.sal as "m�� sal"
from emp e, emp m 
where e.mgr = m.empno and e.sal>m.sal;


--- 12�� �� ������

select lower(e.ename), lower(m.ename) as "����"
from emp e, emp m 
where e.mgr = m.empno(+);


-- �Ƚ�����


select lower(e.ename), lower(m.ename) as "����"
from emp e left outer join emp m 
on e.mgr = m.empno;



select lower(e.ename), lower(m.ename) as "����",e.sal as "e�� sal",m.sal as "m�� sal"
from emp e left outer join emp m 
on e.mgr = m.empno where e.sal>m.sal;

--�����Լ�
select ename,round(sal) from emp;
select ename,avg(sal) from emp;-- avg�� �Ѱ��ε� ename�� 12���� �׸� ->������

select count(empno),count(comm),count(mgr) from emp;
select count(*)from emp;

select count(job) from emp;
select count(distinct job) from emp;


select sum(sal),round(avg(sal)),sum(sal)/count(*) from emp;

select round(avg(sal)) as "�޿�" from emp where deptno=10;

select deptno,round(avg(sal)) as "��ձ޿�" from emp 
group by deptno;



-- �μ� �̸��� ��� �޿�

select d.dname,d.deptno,round(avg(e.sal)) as "��ձ޿�" 
from emp e, dept d  
where e.deptno=d.deptno
group by d.deptno,d.dname;



select d.dname,d.deptno,round(avg(e.sal)) as total ,d.loc
from emp e, dept d  
where e.deptno=d.deptno
group by loc
order by total desc;



select loc,avg(sal) as total 
from emp 
     join dept
     on emp.deptno=dept.deptno
group by loc
order by total DESC;



-- �μ��� ��� �޿��� 2000�̻��� ��� 
/*
 select 
 from
 where
 group by
 having 
 order by
 */

select dname,avg(sal) as avgsalary 
from emp join dept on emp.deptno=dept.deptno group by dname having  avg(sal)>2000;


select dname,avg(sal) as avgsalary 
from emp,dept where emp.deptno=dept.deptno 
group by dname having  avg(sal)>2000;


select dept.deptno, max(sal),min(sal),count(*),
       avg(sal) as avgsal
from emp,dept
where emp.deptno=dept.deptno
group by dept.deptno;

-- �޿��� ���� ���� ���

select ename from emp where sal=(select max(sal) from emp);


-- ford ���� �޿��� ���� ��� ���

select ename from emp where sal>(select sal from emp where ename='FORD');

-- ��ü ��պ��� �޿��� ���� �޴� ������

select ename from emp where sal<(select avg(sal) from emp) order by sal;

select ename from emp where sal in (select min(sal) from emp group by deptno);


select min(sal) from emp group by deptno; -- �׷캰�� ���� ���� ���� �̾Ƴ��� 


-- �� �μ����� �ְ� �޿��� ���� ������ -- 2���̻��� �� ���� 

select * from emp where sal in (select max(sal) from emp group by deptno);


select * from emp where (deptno,sal) in (select deptno,max(sal) from emp group by deptno);



