/*Introduction

In the realm of data analysis, missing values are an almost inevitable hurdle. Whether due to human error, data corruption, or incomplete records, missing data can lead to biased, misleading, or inaccurate conclusions. SQL provides a powerful set of tools to identify, analyze, and treat missing values effectively. This guide offers a comprehensive look at handling missing values in SQL for data preprocessing and analysis.

Identifying Missing Values

Definition

In SQL, a missing value is generally represented as NULL.

Detection

You can identify missing values using the IS NULL or IS NOT NULL operators.

Example:

SELECT * FROM Employees WHERE Salary IS NULL;

Approaches to Handle Missing Values

There are multiple ways to approach missing values:

Ignoring Them: Sometimes, missing values are so few that they won't affect the analysis.

Replacing with a Specific Value: Replace NULL with a constant like 0, or a global constant.

Imputation: Replace the missing value with a calculated value such as the mean, median, or mode of the column.

Forward or Backward Fill: Replace the missing value with the next or previous record's value.

Delete Records: Remove records with missing values.

SQL Commands for Handling Missing Values

Replacing with a Specific Value:

UPDATE Employees SET Salary = 0 WHERE Salary IS NULL;

Imputation using Mean:

UPDATE Employees SET Salary = (SELECT AVG(Salary) FROM Employees WHERE Salary IS NOT NULL) WHERE Salary IS NULL;

Delete Records:

DELETE FROM Employees WHERE Salary IS NULL;

Practical Examples

Calculating Average Salary Excluding NULLs:

SELECT AVG(Salary) FROM Employees WHERE Salary IS NOT NULL;

Replacing NULLs in an Output:

SELECT COALESCE(Salary, 0) FROM Employees;

Use Cases

Data Cleaning: Prior to conducting analytics, cleaning the dataset by handling missing values is critical.

Data Integrity: Handling missing values ensures the integrity and reliability of the analysis.

Compliance: In regulated industries, missing data could lead to compliance issues.

Advantages and Disadvantages

Advantages:

Increased Accuracy: Properly dealing with missing values can lead to more accurate analytics.

Better Decision-making: Reliable data leads to better business decisions.

Disadvantages:

Complexity: The various techniques to handle missing values can make queries more complex.

Risk of Bias: Incorrectly handling missing values can introduce bias.

Best Practices

Documentation: Always document how you have decided to handle missing values for future reference.

Consistency: Use a consistent approach to handling missing values across similar datasets.

Analysis: Before settling on an approach, analyze how it affects your dataset and adjust if necessary.

Summary

Missing values are a common issue in data analysis, and SQL offers a plethora of tools for dealing with them. The way you choose to handle missing values can significantly impact the outcome of your analysis, so it's crucial to understand your options. By following best practices and applying the right techniques, you can improve both the integrity and reliability of your analytics processes.

*/
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

