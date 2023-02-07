Create table department(
dept_id int not null primary key,
dept_name varchar(50) null)

Create table employee(
emp_id int not null primary key,
dept_id int not null foreign key references department(dept_id),
mngr_id int null,
emp_name varchar(50)  null,
salary int not null)


select * from employee
select * from Department

//**query-1. write a SQL query to find Employees who have the biggest salary in their Department**//
select employee.emp_id,employee.dept_id,employee.mangr_id,employee.emp_name,employee.salary
from employee 
where employee.salary IN (select MAX(salary) from employee group by dept_id) 





//**query-2. write a SQL query to find Departments that have less than 3 people in it**//
select department.dept_name
from employee inner join department
on  department.dept_id=employee.dept_id
group by department.dept_name
having COUNT(*)<3





//**query-3. write a SQL query to find All Department along with the number of people there**//
select department.dept_name,COUNT(*) As [pople]
from employee inner join  department
on department.dept_id =employee.dept_id
group by department.dept_name




//**query-4. write a SQL query to find All Department along with the total salary there**//
select department.dept_name,sum(salary) as [salary]
from employee inner join  department
on department.dept_id =employee.dept_id
group by department.dept_name