create database islarose
drop database islarose
create table employee(emp_id int primary key,emp_name varchar(50) not null,department varchar(60) not null,phone_no bigint unique check(len(phone_no)=10),email varchar(100))
insert into employee values(100,'ivy','hr',9807234571,'ivy@gmail'),(102,'mae','sales',9802005671,'mae@gmail')
insert into employee values(103,'indi','develop',8307131923,'indi@gmail'),(104,'rae','manage',7307021913,'rae@gmail')
insert into employee values(105,'isla','manage',7307138813,'isla@gmail'),(106,'rose','sales',7307131913,'rose@gmail')
alter table employee add age int
update employee set emp_id=101 where emp_id=100
update employee set age=25 where emp_id=106

select * from employee

create table emp_salary(emp_id int references employee(emp_id),sal int not null,address varchar(50) not null,permanent varchar(3) check(permanent='yes'or permanent='no'))
insert into emp_salary values(101,120000,'sydney','yes'),(102,12000,'sydney','no')
insert into emp_salary values(103,55000,'gabba','yes'),(104,81000,'adelaide','yes')
insert into emp_salary values(105,74000,'adelaide','no'),(106,11000,'sydney','yes')
--truncate table emp_salary

select * from emp_salary
select*from emp_salary where sal=(select max(sal) from emp_salary)
SELECT emp_id, sal FROM emp_salary WHERE sal < (SELECT MAX(sal) FROM emp_salary) ORDER BY sal DESC LIMIT 1
SELECT MAX(sal) AS salary FROM emp_salary WHERE sal <> (SELECT MAX(sal) FROM emp_salary);
--Join
select employee.emp_name,employee.department,emp_salary.emp_id from employee inner join emp_salary on employee.emp_id=emp_salary.emp_id
select employee.emp_name,employee.department,emp_salary.permanent from employee left join emp_salary on employee.emp_id=emp_salary.emp_id
select employee.emp_name,employee.department,emp_salary.permanent from employee right join emp_salary on employee.emp_id=emp_salary.emp_id
select employee.emp_name,employee.department,emp_salary.permanent from employee full join emp_salary on employee.emp_id=emp_salary.emp_id

select emp_salary.permanent,emp_salary.sal from emp_salary where permanent like 'yes%'and sal>=50000
select count(emp_id) as count_of_employee from emp_salary where permanent='yes' and sal>50000

select email from employee where email like '%@gmail'
select * from employee where email like '%@gmail'

select * from employee where department='hr' or department='manage'
select * from employee where department='manage' or department='sales'

select sum(sal) as salary from emp_salary where permanent='yes'
select sum(sal) as totalsalary from emp_salary where permanent='yes'
select * from employee where emp_name like 'r%'

select * from emp_salary where sal>50000
select address,sum(sal)as TotalSalary from emp_salary group by address
select * from emp_salary where address ='sydney'
select * from emp_salary order by  sal asc,address desc
select count(department) as EmpsInHrDep from employee where department='sales'
select employee.emp_name,employee.department,emp_salary.address from employee  join emp_salary on employee.emp_id=emp_salary.emp_id
select address,count(address) as CityCnt from emp_salary group by address
select CONCAT(emp_name,'-',department)as EmpDept from employee
select * from emp_salary where address='adelaide' and permanent='yes'

--Operators
select * from employee where age=25//(=,>,<,>=,<=,<>,)
select * from employee where age<>25
select * from employee where age between 21 and 26
select * from employee where emp_name like '%i'//(%i,i%,%i%,_i%)
select * from employee where emp_name like 'i__%'
select * from employee where emp_name not like 'i%'
select * from employee where emp_name like 'm%'or age>=24

--Functi0ns
select avg(age) as AvgAge from employee
select sum(age) as SumAge from employee
select max(sal) as MaxSal from emp_salary
select min(sal) as MinSal from emp_salary
select count(sal) as SalCnt from emp_salary
select upper(email) as NameInUp from employee
select lower(emp_name) as EmailInLow from employee
select GETDATE() as DateTime
select LEN(email) as LenOfEmail from employee
select address,sum(sal) as SumSal from emp_salary group by address

select distinct department as DepName from employee order by department desc
select distinct upper(department) as DepName from employee
select SUBSTRING(address,1,3) as SubStr from emp_salary
select * from employee where department in('sales','manage')
select address,sum(sal) as TotSal from emp_salary group by address
select * from emp_salary where sal between 11000 and 60000
select department,count(department) as DepCnt from employee group by department


select * from employee
select * from emp_salary
select * into emp_sal_copy from emp_salary
select * from emp_sal_copy
select emp_id,address into emp_det from emp_sal_copy
select * from emp_det
drop table emp_det
drop table emp_sal_copy


create procedure emp
@department varchar(60)
as
begin
select * from employee where department =@department
end
go

exec emp @department='manage'

create procedure sal
@address varchar(20)
as
begin
select * from emp_salary where address=@address
end
go

exec sal @address='sydney'