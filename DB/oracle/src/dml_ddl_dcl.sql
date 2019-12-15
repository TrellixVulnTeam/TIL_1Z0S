######################################################
Table ����   DDL  (auto commit)

���̺��� ������ �����͵��� ����Ǵ� �� �̶�� �����ϸ� ���� ���� �� �� ������, 
CREATE TABLE ��ɾ �̿��ؼ� ���̺��� ���� �� �� �ִ�. 
######################################################

������Ÿ�Լ���
	VARCHAR2 Ÿ��
	- �������� ������ ������ Ÿ�� 
	- �ִ� ���� : 2000 ����Ʈ(�ݵ�� ���� ����) 
	- �ٸ� Ÿ�Կ� ���� ������ ���� 
	- �Ϻθ� �Է½� �޺κ��� NULL 
	- �Է��� ���� �޺κп� �ִ� BLANK�� ���� �Է� 
	- ���� ���� ���� ������ NULL ���� �Է� 
	- ������ ���̺��� ��� �Է½� ���� �߻� 
	- �÷� ������ ������ ���� ���, NULL �� �ԷµǴ� ��찡 ���� ��� VARCHAR2 ��� 

	NUMBER Ÿ��
	- ������ ����Ÿ Ÿ��, ����, ZERO, ��� ���� 
	- ��ü �ڸ����� 38�ڸ��� ���� �� ���� 
	- �Ҽ����� �������� �ʾ��� �� �Ҽ����� �Էµǰų�, ������ �Ҽ����ڸ� �̻� �ԷµǸ� �ݿø��Ǿ� ���� 
	- ������ ���� �ڸ��� �̻� �Է½� ���� �߻� 
	- ������ �ʿ��� �÷��� NUMBERŸ������ �����Ѵ�. 
	- NUMBER(p,s) �� ������ p�� s�� �ڸ����� ������ ���̹Ƿ� �����Ͽ� P�� �ڸ����� ���� 
	- NUMBER Ÿ���� �׻� �������̹Ƿ� ����ϰ� ������ �� 

	DATE Ÿ��
	- ���ڿ� �ð��� �����ϴ� ��¥�� Ÿ�� 
	- ���ڳ� �ð��� ������ ����� ��� ��� 
	- �������� : ����, �⵵, ��, ��, �ð�, ��, �� 
	- NLS_DATE_FORMAT�� �̿��Ͽ� ������ Ư������ �ذ� 
	- Ư���� �ð��� �������� ������ 00:00:00�� �Է� �� 
	- Ư���� ���ڸ� �������� �ʾҴٸ� ������� 1�Ϸ� ���� �� 
	- SYSDATE�� �����ϰ� �ð��� ���� 
	
	
drop table book;
commit;

create table book( 
    bookno   number(5),
    title    varchar2(40),
    author   varchar2(30),
    pubdate  date
); 
commit;
alter table book add(price number(7));
alter table book modify(price number(7,2));




rollback;  -- ���
commit;    -- �Ϸ�

select * from book;
	
-- DML ����    insert ,update ,delete	
	
insert into book values(1,'java','ȫ�浿',sysdate);
insert into book values(2,'sql','��浿','2018/01/01');
insert into book values(2,'sql','��浿','2018/01/01');
insert into book values(3,'html5','��浿','2017/01/01');
insert into book values(4,'db',null,null);
	
insert into book(bookno,title,author,pubdate) 
values(5,'db',null,null);
	
insert into book(bookno,author,pubdate,title) 
values(5,'db',null,null);	
	
insert into book(bookno,title) 
values(6,'spring');		

delete from book;
rollback;

delete from book where bookno=3;

select * from book;

delete from book where title is null;
commit;

update book set title='~~~~';
rollback;
update book set title='~~~~' where bookno=5;
update book set title='~~~~',author='kim' where bookno=5;
commit;

desc book; --���̺� ����


update book set price=0 ;
update book set price=99.99 ;

update book set price=null ;


update book set price=99.99 ;

alter table book drop column price;

rename book to book2;

select * from book2;

rename book2 to book;

delete from book; --rollback ���� 
truncate table book; -- auto commit
drop table book; -- auto commit


select * from emp;
select * from dept;

create table emp2 as select * from emp;
create table dept2 as select * from dept;

insert into dept (deptno,dname,loc) values(50,'EDU','SEOUL');
insert into dept2 (deptno,dname,loc) values(50,'EDU','SEOUL');
commit;

insert into dept (deptno,dname,loc) values(10,'EDU','SEOUL');
insert into dept2 (deptno,dname,loc) values(10,'EDU','SEOUL');
commit;

insert into emp(empno,ename,sal,deptno) 
          values(999,'ȫ',900,50);  

insert into emp2(empno,ename,sal,deptno) 
          values(999,'ȫ',900,90);  


-- �������� ���� ���

drop table book;
create table book( 
    bookno   number(5) CONSTRAINT scott_book_PK PRIMARY KEY,
    title    varchar2(40),
    author   varchar2(30),
    price    number(7,2) 
            CONSTRAINT scott_book_price_check check(price > 0),
    pubdate  date default sysdate
);           
          
insert into book(bookno,title,author,price) 
values(1,'java..','ȫ�浿',900);	
commit;
          
insert into book(bookno,title,author,price) 
values(2,'sql','��浿',9900);	          
          


drop table book;
create table book( 
    bookno   number(5) PRIMARY KEY,
    title    varchar2(40) unique,
    author   varchar2(30),
    price    number(7,2) check(price > 0),
    pubdate  date default sysdate
);   


drop table book;
create table book( 
    bookno   number(5) ,
    title    varchar2(40) unique,
    author   varchar2(30),
    price    number(7,2) check(price > 0),
    pubdate  date default sysdate
);   

alter table book add CONSTRAINT book_PK PRIMARY KEY(bookno);
alter table book drop CONSTRAINT book_PK ;

truncate table book;


##########################################
emp2   dept2 ���� ���� �߰� ���� 
##########################################

drop table emp2 cascade CONSTRAINT;
drop table dept2 cascade CONSTRAINT;

create table emp2 as select * from emp;
create table dept2 as select * from dept;

alter table emp2 add CONSTRAINT emp2_PK PRIMARY KEY(empno);
alter table dept2 add CONSTRAINT dept2_PK PRIMARY KEY(deptno);

alter table emp2 
add CONSTRAINT emp2_FK_DEPTNO 
foreign key(deptno)  REFERENCES dept2  ;

alter table emp2 
add CONSTRAINT emp2_FK_mgr 
foreign key(mgr)  REFERENCES emp2   ;

insert into emp2(empno,ename,sal,deptno,mgr) 
          values(999,'ȫ',900,40,7902);  

insert into emp2(empno,ename,sal,deptno,mgr) 
          values(1111,'ȫ',900,40,7);  

          
-- Ʈ�����

delete from emp where empno=7902;

update emp set comm=0 where empno=7902;



------------------------------------------------


ALTER TABLE EMP DROP CONSTRAINT FK_DEPTNO;

DELETE TABLE EMP ADD CONSTRAINT FK_DEPTNO
FOREIGN KEY(DEPTNO) REFERENCES DEPT ON DELETE SET NULL;
          

--------------------------------------------------------

alter table emp drop constraint fk_deptno
foreign key(deptno) references dept on delete cascade;

delete from emp where deptno=10;




