CREATE DATABASE MAHI;
USE MAHI;
CREATE TABLE mahi_detail(
ID INT NOT NULL PRIMARY KEY, NAME VARCHAR(20) , AGE INT
);
insert into mahi_detail values(1,"uma",20),(2,"chinnodu",19);
select * from mahi_detail;



CREATE DATABASE customer;
Create table customersTable(customerID int primary key,customerName varchar(100),Email Varchar(100));
create table orders(orderID int primary key,orderdate Date,customerID Int,totalamount decimal(10,2));
select*from orders; 
insert into customersTable(customerID,customerName,Email ) values('1','uma','edho'),('2','chinnodu','fhhf'),('3','pandu','fdg'),('4','nani','jjjf');
insert into orders(orderID,orderdate,customerID,totalamount) VALUES('1','2024-08-03','2',100.00),('2','2024-08-04','3',200.00),('3','2024-08-05','5',300.00);

select customersTable.customerName,orders.totalamount
from customersTable
left join orders
on customersTable.customerID=orders.customerID;

select customersTable.customerName,orders.totalamount
from customersTable
right join orders
on customersTable.customerID=orders.customerID;
