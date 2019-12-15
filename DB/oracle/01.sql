sqlplus system/1234
conn hr/hr;

conn system/1234;
alter user hr identified by hr account unlock;


conn hr/hr;
sqlplus hr/hr;

select * from tab; --table list Ȯ��

select * from employees; 

---- ���� ���� -----
conn system/1234;


create TABLESPACE mc 
datafile 'C:\oraclexe\app\oracle\oradata\XE\mc.dbf'
size 10M
autoextend on next 1M maxsize UNLIMITED;

--drop TABLESPACE mc  INCLUDING CONTENTS AND Datafiles;
-- ���� ���� --

create user test01 identified by 1234 -- ��������
default tablespace mc;

grant connect,resource,dba to test01; -- ������ ������ ��

reboke dba from test01;

drop user test01 cascade; -- ���� ����

drop user SCOTT cascade;
-- scott ���� 
create user SCOTT identified by TIGER
default tablespace mc;


scott.sql -- ���� �غ�
@ c:\lib\scott.sql;



set linesize 300;
set pagesize 20;


col ename for a12; 
col job a12;
col deptno for 9999; 
col sal for 9999; 


col employee_id for a12;
col first_name a12;
col last_name a12;
col email a12;
col phone_number a12;
col hire_date a12;
col job_id a12;
col salary a12;
col commision_pct a12;
col manager_id a12;
col department_id a12;

col employee_id for 9999;
col first_name for 9999;
col last_name for 9999;
col email for 9999;
col phone_number for 9999;
col hire_date for 9999;
col job_id for 9999;
col salary for 9999;
col commision_pct for 9999;
col manager_id for 9999;
col department_id for 9999;