--1. �� ���(employee)�� ���ؼ� ���(employee_id),
--�̸�(first_name), �μ���(department_name),
--�Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�Ͻÿ�.
--

select e.employee_id, e.first_name, department_name , m.first_name 
from employees e left outer join employees m on e.manager_id=m.manager_id join departments d on e.department_id=d.department_id;



--����2. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)��
-- ����(salary)�� ����Ͻÿ�. 



select e.last_name , e.salary from employees e left outer join employees m on e.manager_id=m.manager_id where e.salary>m.salary;



--����3. ȸ�� ������ ���� users ���̺��� �����մϴ�.
--�α��ο� �ʿ��� id ������ pw ������ �ʼ��Դϴ�.
--
--���� Query ������ �ۼ��Ͻʽÿ�. 
--���̺� ������


CREATE TABLE users
       (id  VARCHAR2(10) CONSTRAINT PK_ID_USERS PRIMARY KEY,
        pw  VARCHAR2(18) not null,
	    birthdate DATE,
	    price NUMBER(9),
        product_name varchar2(10) );
        
        
--ȸ�� ��� sql ����
INSERT INTO users VALUES
('hennie','1233445','SMITH',to_date( '23-1-1982','dd-mm-yyyy'),800,'������');

INSERT INTO users VALUES
('areun','102902','MARRY',to_date( '21-2-1992','dd-mm-yyyy'),300,'������');
INSERT INTO users VALUES
('kange22','583292','HARRY',to_date( '18-9-2003','dd-mm-yyyy'),200,'����');


--- 
  
        
        

        
        
        


