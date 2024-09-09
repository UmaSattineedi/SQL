use Subquery;
-- Create departments table
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Create employees table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Insert values into department table
INSERT INTO department (department_id, department_name, location)
VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'Chicago');

-- Insert values into employee table
INSERT INTO employee (employee_id, employee_name, salary, department_id)
VALUES
(101, 'John Doe', 5000, 1),
(102, 'Jane Smith', 6000, 2),
(103, 'Michael Johnson', 5500, 3),
(104, 'Emily Davis', 4800, 1),
(105, 'Peter Parker', 5200, 2);

-- Insert a new employee with the same salary as the highest-paid employee
INSERT INTO employee (employee_id, employee_name, salary, department_id)
VALUES (106, 'Bruce Wayne', 
        (SELECT MAX(salary) FROM employee), 
        3);

-- Create a new table for high-salary employees
CREATE TABLE high_salary_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert employees with salary greater than 5500 into high_salary_employees table
INSERT INTO high_salary_employees (employee_id, employee_name, salary, department_id)
SELECT employee_id, employee_name, salary, department_id 
FROM employee 
WHERE salary > 5500;

-- Create a new table for employees with above-average salaries
CREATE TABLE above_average_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert employees with salary greater than the average salary of their department
INSERT INTO above_average_salary (employee_id, employee_name, salary, department_id)
SELECT e.employee_id, e.employee_name, e.salary, e.department_id
FROM employee e
WHERE e.salary > (SELECT AVG(salary) 
                  FROM employee
                  WHERE department_id = e.department_id);

-- Drop tables if they already exist
DROP TABLE IF EXISTS high_salary_employees;
DROP TABLE IF EXISTS above_average_salary;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert values into departments table
INSERT INTO departments (department_id, department_name, location)
VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'Chicago');

-- Insert values into employees table
INSERT INTO employees (employee_id, employee_name, salary, department_id)
VALUES
(101, 'John Doe', 5000, 1),
(102, 'Jane Smith', 6000, 2),
(103, 'Michael Johnson', 5500, 3),
(104, 'Emily Davis', 4800, 1),
(105, 'Peter Parker', 5200, 2);

-- Insert a new employee with the same salary as the highest-paid employee
INSERT INTO employees (employee_id, employee_name, salary, department_id)
VALUES (106, 'Bruce Wayne', 
        (SELECT MAX(salary) FROM employees), 
        3);

-- Create a new table for high-salary employees
CREATE TABLE high_salary_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert employees with salary greater than 5500 into high_salary_employees table
INSERT INTO high_salary_employees (employee_id, employee_name, salary, department_id)
SELECT employee_id, employee_name, salary, department_id 
FROM employees 
WHERE salary > 5500;

-- Create a new table for employees with above-average salaries
CREATE TABLE above_average_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert employees with salary greater than the average salary of their department
INSERT INTO above_average_salary (employee_id, employee_name, salary, department_id)
SELECT e.employee_id, e.employee_name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (SELECT AVG(salary) 
                  FROM employees
                  WHERE department_id = e.department_id);
SET @max_salary = (SELECT MAX(salary) FROM employees);
INSERT INTO employees (employee_id, employee_name, salary, department_id)
VALUES (106, 'Bruce Wayne', @max_salary, 3);


-- Drop tables if they already exist
DROP TABLE IF EXISTS high_salary_employees;
DROP TABLE IF EXISTS above_average_salary;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert values into departments table
INSERT INTO departments (department_id, department_name, location)
VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'Chicago');

-- Insert values into employees table
INSERT INTO employees (employee_id, employee_name, salary, department_id)
VALUES
(101, 'John Doe', 5000, 1),
(102, 'Jane Smith', 6000, 2),
(103, 'Michael Johnson', 5500, 3),
(104, 'Emily Davis', 4800, 1),
(105, 'Peter Parker', 5200, 2);

-- Set a variable with the maximum salary
SET @max_salary = (SELECT MAX(salary) FROM employees);

-- Insert a new employee with the same salary as the highest-paid employee
INSERT INTO employees (employee_id, employee_name, salary, department_id)
VALUES (106, 'Bruce Wayne', @max_salary, 3);

-- Create a new table for high-salary employees
CREATE TABLE high_salary_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert employees with salary greater than 5500 into high_salary_employees table
INSERT INTO high_salary_employees (employee_id, employee_name, salary, department_id)
SELECT employee_id, employee_name, salary, department_id 
FROM employees 
WHERE salary > 5500;

-- Create a new table for employees with above-average salaries
CREATE TABLE above_average_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert employees with salary greater than the average salary of their department
INSERT INTO above_average_salary (employee_id, employee_name, salary, department_id)
SELECT e.employee_id, e.employee_name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (SELECT AVG(salary) 
                  FROM employees
                  WHERE department_id = e.department_id);
-- View all data in the employees table
SELECT * FROM employees;

-- View all data in the departments table
SELECT * FROM departments;

-- View all data in the high_salary_employees table
SELECT * FROM high_salary_employees;

-- View all data in the above_average_salary table
SELECT * FROM above_average_salary;

SHOW TABLES;

-- Describe the structure of a table
DESCRIBE employees;

-- Or show the create table statement
SHOW CREATE TABLE employees;


