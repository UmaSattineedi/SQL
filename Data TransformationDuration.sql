/*Introduction

Data transformation is an indispensable step in the data analysis pipeline. It refers to the conversion or mapping of data from its original raw form into another format. This is often done to clean, aggregate, enrich, or otherwise prepare data for analysis. SQL excels at various data transformation tasks, offering both simple and complex methods to manipulate data. This article provides a comprehensive guide on data transformation in SQL.



Basic Data Transformation Operations

Here are some of the most commonly used data transformation operations in SQL:

Case Conversion: Converting data to upper or lower case.

String Manipulation: Trimming, concatenating, and substring.

Date Formatting: Changing the date format.

Type Casting: Converting data types.

Normalization: Scaling numerical values.

Aggregation: Sum, average, count, etc.

Examples:

Case Conversion

SELECT UPPER(Name), LOWER(Name) FROM Customers;

String Manipulation

SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Customers;

Date Formatting

SELECT FORMAT(JoinDate, 'MM-dd-yyyy') FROM Employees;

Type Casting

SELECT CAST(Age AS FLOAT) FROM Customers;

Normalization

SELECT (Salary - MIN(Salary)) / (MAX(Salary) - MIN(Salary)) FROM Employees;

Aggregation

SELECT SUM(Revenue), AVG(Revenue) FROM Sales;

Advanced Data Transformation Techniques

Pivoting: Transforming rows into columns.

Window Functions: Performing calculations across a set of table rows.

Hierarchical Data Transformation: Managing parent-child relationships.

Examples:

Pivoting

SELECT Year,

SUM(CASE WHEN Month = 'Jan' THEN Revenue END) AS Jan_Revenue,

SUM(CASE WHEN Month = 'Feb' THEN Revenue END) AS Feb_Revenue

FROM Sales

GROUP BY Year;

Window Functions

SELECT Name, Salary,

AVG(Salary) OVER (PARTITION BY Department) AS Avg_Department_Salary

FROM Employees;

Hierarchical Data

SELECT EmployeeID, Name, ManagerID

FROM Employees

CONNECT BY PRIOR EmployeeID = ManagerID;

Use Cases

Data Cleaning: Transformation ensures that only high-quality data is used for analysis.

Data Integration: Combining data from multiple sources may require transformations to align data schemas.

Feature Engineering: Creating new features for machine learning models.

Data Visualization: Transforming data for easier or more effective visualization.

Advantages and Disadvantages

Advantages:

Data Quality: Transformations can improve data quality by handling missing values, duplicates, etc.

Better Insights: Properly transformed data can lead to more accurate analyses and insights.

Disadvantages:

Processing Overhead: Some transformations are computationally expensive.

Complexity: Advanced transformations can make queries complex and hard to manage.

Best Practices

Audit and Validate: Always verify that the transformation logic is correct and achieves the intended results.

Optimization: Use indexing, partitioning, and other performance enhancements to optimize transformation operations.

Documentation: Maintain thorough documentation for each transformation to ensure repeatability and traceability.

Summary

Data transformation is crucial for preparing data for analysis and making it easier to draw useful insights. SQL offers a robust toolkit for both basic and advanced data transformations, which can significantly enhance your data preprocessing and analytics capabilities. By understanding the intricacies of these techniques, you can ensure the highest data quality and analytical accuracy.*/

create database data;
use data;
create table customers(
	CustomerID int primary key,
    Firstname varchar(50),
	Lastname varchar(50)
);
INSERT INTO customers(CustomerID, Firstname, Lastname)
VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Brown'),
(4,'Tom','jerry');

select concat(Firstname,' ',Lastname)
from customers;

select upper(Firstname) as UpperCaseFirstName
from customers;

select lower(Firstname) as lōwerCaseFirstName
from customers;

create table orders(
	orderID int,
    customerID int,
    orderDate Date,
    totalAmount decimal(10,2)
    );
    
INSERT INTO orders (orderID, customerID, orderDate, totalAmount)
VALUES
(101, 1, '2024-09-12', 150.50),
(102, 2, '2024-09-13', 250.75),
(103, 1, '2024-09-14', 300.00),
(104, 3, '2024-09-15', 175.20);

create table Products(
	ProductID int primary key,
    ProductName varchar(50),
    UnitPrice decimal(10,2)
);
INSERT INTO Products (ProductID, ProductName, UnitPrice)
VALUES
  (201, 'Laptop', 999.99),
  (202, 'Smartphone', 749.00),
  (203, 'Headphones', 129.95);

  





