
select * from emp;
select * from tab;
select * from dept;

select ename,sal,sal*12 from emp;
select sal,sal*12 as total_hire_money from emp;\

-- �̸��� ������ �ְ� �ʹٸ� ���� �����̼����� ! (�̸� ����)

select sal,sal*12 as "total hire money" from emp;

-- ����! -> ����Ŭ���� ���ڿ��� ' '�̰� ���⿡���� ���������̼��̴�!


select empno,ename,sal from emp;
select * from emp where COMM is not null;


select ename,sal,comm,sal+comm as"�հ�" from emp;
-- nvl function: 
-- NVL(COMM-> �굵 ����, 0<- �굵 ����)
select ename,sal,NVL(comm,0) ,sal+NVL(comm,0) 
as"�հ�" from emp;


SELECT empno,ename,job,mgr from emp;


-- null�� ���� �ٲٴ°� nvl -- üũ!
-- ����! SIGLE ���� DOUBLE����
SELECT empno,ename,job,NVL(to_char(mgr), '<top>') FROM emp;


-- ���ڿ� ���� ������ ||

select empno ||' '|| ename ||' ' || job from EMP;


select 12*12*30 from emp;
select 12*12*30 from dual; -- ������ ���̺�


select sysdate from dual; -- ��¥�� ����

-- �ߺ� ����

select distinct job from EMP;

-- row ���� where �� --(where���ȿ�) ��Ī�� �Ἥ�� �ȵ�
select * from  emp where deptno=10;
select ename,job,hiredate from emp where deptno=10;


-- ��ҹ��ڸ� ���⼭�� ������
select *from emp where UPPER(job)=UPPER('MANAGER') ORDER BY DEPTNO;
select *from emp where LOWER(job)=LOWER('MANAGER') ORDER BY DEPTNO;


-- �Ի����� --<> : ���� ����
SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE='81/05/01' ;
SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE<>'81/05/01' ;
SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE !='81/05/01' ;

desc emp;

-- between and ���Ѱ� ���� ���
select ename,job,sal from emp where SAL>=2000 AND SAL<=3000;
select ename,job,sal from emp where SAL between 2000 and 3000;


select * from emp where deptno=10 or deptno=20;
select * from dept;
select * from dept where (deptno,loc) in ((10,'NEW YORK'),(20,'CHICAGO'));

-- LIKE ������
-- A�� ���Ե� �̸��� ã�� �ʹ�
-- �빮�� A�� ���Ե�
SELECT * FROM EMP WHERE ENAME LIKE 'A%';
-- �ڿ� A�� ����
SELECT * FROM EMP WHERE ENAME LIKE '%H';

-- A�� ���Ե�

SELECT * FROM EMP WHERE ENAME LIKE '%A%';
SELECT * FROM EMP WHERE ENAME LIKE UPPER('%A%');

-- M ��  T ���̿� �ִ� ���� ã�� ���� �� ����� ����
SELECT * FROM EMP WHERE ENAME LIKE '%M_T%';


-- 81�⵵�� �Ի��� ����� ���
SELECT *FROM EMP WHERE HIREDATE LIKE'81%';
SELECT *FROM EMP WHERE HIREDATE LIKE'81/%';
SELECT *FROM EMP WHERE HIREDATE LIKE'81/%/%';

--09������ ���� �� 
SELECT *FROM EMP WHERE HIREDATE LIKE'%/09/%';


-- �̸��� A B C D �� ���� �ϴ� ����� ��� -- �ٽ� �� Ȯ��

SELECT * FROM EMP WHERE ENAME LIKE 'A%' OR 'B%' OR 'C%'  OR 'D%';



