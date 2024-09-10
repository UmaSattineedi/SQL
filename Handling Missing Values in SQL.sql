create database LargeData;
use LargeData;

create table employees(
	employeeID int primary key,
    employeeName varchar(50),
    age int,
    department varchar(50),
    salary decimal(10,2)
);

insert into employees(employeeID,employeeName,age,department,salary)
values ('6','uma',30,'hr','50000.00'),
		('7','mahi',null,'sales','60000.00'),
        ('8','milky',25,null,null),
        ('9','fruity',21,'finance','70000.00'),
        ('10','sai',22,'sales','65000.00');


select * from employees;        

update employees as e
Join(
	select avg(age) as AvgAge
    from employees
    where age is not null
) as sub

set e.age = sub.AvgAge
where e.age is null;


delete from employees
where salary is null;

truncate table employees;

update employees
set department = 'unknown'
where department is null;

