

create or replace view max_sal_dept
as
select *
from emp 
where 
(deptno,sal) in (select deptno, max(sal) from emp group by deptno);


select deptno,ename,sal from max_sal_dept;




############################################
--sequence
############################################
--��������?
-- ����(UNIQUE)�� ���� �������ִ� ����Ŭ ��ü�̴�. 
-- �������� �����ϸ� �⺻Ű�� ���� ���������� �����ϴ� �÷��� �ڵ������� ���� �� �� �ִ�. 
-- ���� PRIMARY KEY ���� �����ϱ� ���� ��� �Ѵ�. 
-- �޸𸮿� Cache�Ǿ��� �� ���������� �׼��� ȿ���� ���� �Ѵ�. 
-- �������� ���̺���� ���������� ����ǰ� �����ȴ�.

delete from emp2;
delete from dept2;

create sequence dept_seq;

insert into dept2 (deptno,dname,loc) 
  values(dept_seq.nextval,'EDU','SEOUL');

select dept_seq.currval from dual;
select dept_seq.nextval from dual;

drop sequence dept_seq;

create sequence dept_seq start with 10 increment by 10;

insert into dept2 (deptno,dname,loc) 
  values(dept_seq.nextval,'EDU','SEOUL');

delete from dept2;
commit;

insert into dept2 (deptno,dname,loc) 
  values((select nvl(max(deptno),0)+1 from dept2),'EDU','SEOUL');


select nvl(max(deptno),0)+1 from dept2;

