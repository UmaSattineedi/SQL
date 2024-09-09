-- create database window_functions;
-- use window_functions;

create table employees(
	employeeID int primary key,
    employeeName varchar(50),
    department varchar(50),
    salary decimal(10,2)
);

insert into employees(employeeID,employeeName,department,salary)
values ('1','uma','hr','50000.00'),
		('2','mahi','sales','60000.00'),
        ('3','milky','hr','55000.00'),
        ('4','fruity','finance','70000.00'),
        ('5','sai','sales','65000.00');
select  employeeID,employeeName,department,salary, 
        avg(salary) over(partition by department) as avgSalary
from employees;
   
-- Row number function
select  employeeID,employeeName,department,salary, 
        row_number() over (order by salary desc) as RowNumber
from employees;

-- Rank function
select  employeeID,employeeName,department,salary, 
        rank() over (order by salary desc) as employeeRank
from employees;

insert into employees(employeeID,employeeName,department,salary)
values ('6','deepu','hr','50000.00'),
		('7','datta','sales','60000.00');

-- dense Rank function
select  employeeID,employeeName,department,salary, 
        dense_rank() over (order by salary desc) as DenseemployeeRank
from employees;

-- sum function
select employeeID,employeeName,department, 
        sum(salary) over (order by department desc) as departmentTotalSalary
from employees;

select employeeID,employeeName,department, 
        avg(salary) over (order by department desc) as departmentTotalSalary
from employees;

select employeeID,employeeName,department, 
        max(salary) over (order by department desc) as departmentMaxSalary
from employees;

select employeeID,employeeName,department, 
        min(salary) over (order by department desc) as departmentMinSalary
from employees;