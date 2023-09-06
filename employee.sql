create table employee(emp_id int primary key,emp_name varchar(50) not null,department varchar(60) not null,phone_no bigint unique check(len(phone_no)=10),email varchar(100))
insert into employee values(100,'ivy','hr',9807234571,'ivy@gmail'),(102,'isla','sales',9802345671,'isla@gmail'),(103,'indi','manage',9307131961,'indi@gmail')
insert into employee values(104,'isla','develop',8307131923,'isla@gmail')
insert into employee values(105,'rose','devel',7307131913,'rose@gmail')

create table emp_sal(emp_id int references employee(emp_id),sal int not null,permanent varchar(3) check(permanent='yes'or permanent='no'))
insert into emp_sal values(100,10000,'yes'),(102,12000,'no'),(103,11000,'yes')
insert into emp_sal values(104,75000,'yes')
insert into emp_sal values(105,65000,'no')

select * from employee
select * from emp_sal

--select emp_sal.permanent,emp_sal.sal from emp_sal where permanent like 'yes%'and sal>=50000
select count(emp_id) as count_of_employee from emp_sal where permanent='yes' and sal>50000
--select email from employee where email like '%@gmail'
select * from employee where email like '%@gmail'
select * from employee where department='hr' or department='develop'
select * from employee where department='hr' or department='develop'
--select sum(sal) as salary from emp_sal where permanent='yes'
select sum(sal) as totalsalary from emp_sal where permanent='yes'
select * from employee where emp_name like '%a'


--EmployeeInfo
create table emp_info(emp_id int primary key,emp_f_name varchar(20),emp_l_name varchar(20),department varchar(20),project varchar(10),address varchar(20),dob date,gender varchar(10))
insert into emp_info values(101,'isla','rose','admin','p1','sydney','02/12/1979','female'),(102,'indi','rae','admin','p2','paddington','02/10/1986','female')
insert into emp_info values(103,'ivy','mae','hr','p3','london','06/05/1983','female'),(104,'david','warner','hr','p4','sydney','08/11/1983','male'),(105,'shiva','jr','hr','p5','south','07/06/1994','male')

select * from emp_info

--Employeeposition
create table emp_position(emp_id int references emp_info(emp_id),emp_posi varchar(20),dateofjoin date,salary int)
insert into emp_position values(101,'executive','01/04/2020',75000),(102,'manager','03/04/2020',500000),(103,'manager','02/04/2020',150000)
insert into emp_position values(104,'officer','02/04/2020',90000),(101,'manager','03/04/2020',300000)

select * from emp_position

--Answers
--1)
select * from emp_position where salary>=150000
--2)
select emp_posi,sum(salary)as TotalSalary from emp_position group by emp_posi
--3)
select * from emp_info where address ='sydney'
--4)
select * from emp_info order by department asc,emp_l_name desc 
--5)
select count(department) as EmpsInHrDep from emp_info where department='hr'
--6)
select emp_info.emp_f_name,emp_info.department,emp_position.dateofjoin from emp_info inner join emp_position on emp_info.emp_id=emp_position.emp_id
--7)
select * into new_emp from emp_info
select * from new_emp
--8)
select emp_posi,count(emp_posi) as EmpPosCnt from emp_position group by emp_posi
--9)
select CONCAT(emp_f_name,'',emp_l_name,'')as FullName from emp_info
--10)
select * from emp_info where department='hr' and gender='female'