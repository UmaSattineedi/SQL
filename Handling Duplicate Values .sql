/*Introduction

Duplicate data is a common challenge that can distort analysis and lead to incorrect conclusions. Duplicates can arise due to several factors like data entry errors, poor data management, or system glitches. SQL provides robust features to identify, analyze, and eliminate duplicate records to ensure data integrity. This comprehensive guide focuses on handling duplicates in SQL for data preprocessing and analysis.



Identifying Duplicate Records

Definition

Duplicate records are rows in a table that have identical values in all or some of the columns.

Detection Methods

The most common way to identify duplicates is to use the GROUP BY clause in conjunction with the HAVING clause.

Example:

-- Identifying duplicates based on a specific column

SELECT ColumnName, COUNT(*)

FROM TableName

GROUP BY ColumnName

HAVING COUNT(*) > 1;

Approaches to Handling Duplicates

Retaining Unique Records: You can use the DISTINCT keyword to remove duplicates and retain unique records during the query execution.

Delete Duplicates: You can delete duplicate rows from the table, keeping only one instance of each duplicated record.

Set Flag: Flag duplicate records for manual inspection.

Avoiding Duplicates: Use constraints like UNIQUE to prevent duplicates at the time of data insertion.

SQL Commands for Handling Duplicates

Using DISTINCT:

SELECT DISTINCT ColumnName FROM TableName;

Deleting Duplicates:

DELETE FROM TableName

WHERE RowId NOT IN (

SELECT MIN(RowId)

FROM TableName

GROUP BY ColumnName);

Flagging Duplicates:

-- Adding a new column to flag duplicates

ALTER TABLE TableName ADD COLUMN IsDuplicate BOOLEAN DEFAULT FALSE;

-- Flagging duplicates

UPDATE TableName SET IsDuplicate = TRUE

WHERE RowId NOT IN (

SELECT MIN(RowId)

FROM TableName

GROUP BY ColumnName);

Practical Examples

Removing Duplicates while Joining Tables:

SELECT DISTINCT a.ColumnName, b.AnotherColumnName

FROM TableA a

JOIN TableB b ON a.Id = b.Id;

Creating a Table without Duplicates:

CREATE TABLE NewTable AS

SELECT DISTINCT * FROM OldTable;

Use Cases

Data Cleaning: Ensuring a dataset is free from duplicates before analysis.

Data Quality: Improving the quality and accuracy of datasets for reporting.

Optimization: Reducing storage costs and improving query performance by eliminating duplicates.

Advantages and Disadvantages

Advantages:

Improved Data Integrity: Handling duplicates ensures that the data is accurate and trustworthy.

Better Analysis: Accurate data leads to better analytics and informed decision-making.

Disadvantages:

Complex Queries: Handling duplicates can make SQL queries complicated.

Manual Oversight: Flagging duplicates for manual review may require additional resources.

Best Practices

Data Validation: Employ data validation rules to minimize the chance of duplicates at the point of entry.

Regular Audits: Periodically check for duplicates and remove them to maintain data quality.

Transaction Management: Use transactions when deleting duplicates to ensure data consistency.

Summary

Handling duplicates is an essential step in data preprocessing and analysis. SQL provides a versatile set of tools for dealing with duplicates, allowing you to maintain the integrity and reliability of your datasets. Understanding and applying these techniques can significantly improve your analytics processes, making your analyses more accurate and actionable.*/

create database sales;
use sales;
create table Sales(
	SalesID int primary key,
    ProductName varchar(50),
    SalesAmount decimal(10,2)
);
INSERT INTO Sales (SalesID, ProductName, SalesAmount)
VALUES
  (1, 'Laptop', 999.99),
  (2, 'Smartphone', 749.00),
  (3, 'Headphones', 129.95),
  (4, 'Tablet', 399.00),
  (5, 'Smartphone', 749.00),
  (6, 'Laptop', 999.99);
  
  select * from Sales;
  Delete s1 
  from Sales s1
  join Sales s2 on s1.ProductName=s2.ProductName and s1.SalesAmount = s2.SalesAmount
  where s1.SalesID>s2.SalesID;

truncate table Sales;
select ProductName,SUM(SalesAmount) as TotalSales
from Sales
group by ProductName;


select *
from Sales
where (ProductName,SalesAmount)in(
	select ProductName,SalesAmount
    from Sales
    group by ProductName,SalesAmount
    having Count(*)>1
);
