
--1. �� ���(employee)�� ���ؼ� ���(employee_id),
--�̸�(first_name), �μ���(department_name),
--�Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�Ͻÿ�.
--

select e.employee_id, e.first_name, department_name , m.first_name 
from employees e left outer join employees m on e.manager_id=m.manager_id join departments d on e.department_id=d.department_id;


--�ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� ����Ͻÿ�.

select e.last_name , e.salary from employees e left outer join employees m on e.manager_id=m.manager_id where e.salary>m.salary;




-- ����3. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 
--- 9,000 �̻�, 10,000 ������ �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�.

select  e.first_name, e.last_name, e.salary from employees e left outer join jobs j on  e.job_id=j.job_id
where e.salary>=9000 and e.salary<=10000  
and j.job_title='Sales Representative';


--����4. Query ������ �ۼ��Ͻʽÿ�. 
-- �ڽ��� �Ŵ������� ä����(hire_date)�� ���� ����� ���(employee_id), ��(last_name)�� ä����(hire_date)�� ��ȸ�϶�.
select * from employees;

select e.employee_id, e.last_name from employees e inner join employees m on e.manager_id=m.manager_id
where e.hire_date> m.hire_date;


--����5. Query ������ �ۼ��Ͻʽÿ�. 
--
--�� ����(job_title)�� ��� �μ�(department_name)���� ����Ǵ��� ��ȸ�ϴ� SQL �������� �ۼ��ϼ���. 
--(��, �������� �ʴ� ������ ǥ������ �ʰ� �ߺ��Ǵ� ������ �ϳ��� ǥ���մϴ�.)
--���: JOB_TITLE | DEPARTMENT_NAME

select j.job_title,d.department_name from employees e  left outer join departments d  on e.department_id=d.department_id
left outer join jobs j on e.job_id =j.job_id ;


--6. �� �� �Ի��� ���� ��ȸ�ϴ� SQL �������� �ۼ��ϼ���. �� ������ �����ϼ���. 

select to_char(hire_date,'mm') as month ,count(employee_id)||'��' as �Ի��ڼ�
from employees 
group by to_char(hire_date,'mm') 
order by to_char(hire_date,'mm');


select to_char(hire_date,'mm') as month ,count(employee_id)  
from employees 
group by to_char(hire_date,'mm') 
order by 1;



--����7. 08�⵵�� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ��(employee_id), ������ �̸�(first_name)�� ��ȸ�մϴ�. 
--��, �����ڰ� ���� ��������� ��°���� ���ԵǾ�� �մϴ�..  

select first_name, hire_date, employee_id, first_name 
from employees where hire_date like '08/%';


--����8. ��Sales���μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 


select * from employees;
select * from departments;

select first_name, salary, department_name from employees e left outer join  departments d  
on e.department_id=d.department_id where d.department_name='Sales';




--����9. 2004�� �Ի���(hire_date) �������� ���(employee_id), �̸�(first_name), ��(last_name), �μ���(department_name)�� ��ȸ�մϴ�. 
--�̶�, �μ��� ��ġ���� ���� ������ ���, ��<NOT ASSIGNED>���� �����ݴϴ�.

-- ���� �߻�
select e.employee_id, e.first_name,e.last_name , NVL(to_char(d.department_name),'<NOT ASSIGNED>') from employees e 
left outer join departments d on e.department_id=d.department_id ;




--����10. 2003�⿡ �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ��(employee_id), ������ �̸�(first_name)�� ��ȸ�մϴ�. 
--��, �����ڰ� ���� ��������� ��°���� ���ԵǾ�� �մϴ�.. 

select e.first_name,e.hire_date, d.department_name, m.employee_id, m.first_name  
from employees e left outer join employees m on e.manager_id=m.manager_id join departments d on e.department_id=d.department_id;








