/*Exploring Time Series Analysis
Sales data is frequently a foundation of the business analytics field, providing insights into customer behaviour, industry trends, and sales projections. SQL time series analysis can provide priceless insights when used to sales data analysis. Now let's explore an imaginary scenario in which we have a dataset including sales data for a retail business.

Understanding the Sales Dataset
Consider a simplified sales dataset structured as follows:

Date

Sales Amount

Product Category

2023-01-01

500

Electronics

2023-01-02

720

Clothing

...

...

...

2023-12-31

900

Electronics

Analyzing Sales Data with SQL
1. Time-Based Aggregations

Monthly Sales Sum by Product Category

SELECT

DATE_TRUNC('month', Date) AS Month,

Product_Category,

SUM(Sales_Amount) AS Total_Sales

FROM

Sales_Data

GROUP BY

DATE_TRUNC('month', Date), Product_Category

ORDER BY

DATE_TRUNC('month', Date), Product_Category;

This query aggregates the sales data, summing up the 'Sales_Amount' column on a monthly basis while categorizing by 'Product_Category'.

2. Time Shifts and Trends

Calculating Month-over-Month Growth Rate

SELECT

Date,

Product_Category,

Sales_Amount,

LAG(Sales_Amount) OVER (PARTITION BY Product_Category ORDER BY Date) AS Prev_Month_Sales,

(Sales_Amount - LAG(Sales_Amount) OVER (PARTITION BY Product_Category ORDER BY Date)) / LAG(Sales_Amount) OVER (PARTITION BY Product_Category ORDER BY Date) AS Growth_Rate

FROM

Sales_Data;

This query computes the month-over-month growth rate of sales for each product category by comparing current month sales with the previous month's sales.

3. Forecasting Future Sales

Simple Moving Average for Sales Prediction

SELECT

Date,

Product_Category,

Sales_Amount,

AVG(Sales_Amount) OVER (PARTITION BY Product_Category ORDER BY Date ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING) AS Moving_Avg_Sales

FROM

Sales_Data;

This query utilizes a simple moving average technique to forecast sales trends by calculating the average sales amount within a moving window of the past three months and the current month for each product category.

4.Seasonal Analysis

Calculating Yearly Total Sales

SELECT

EXTRACT(YEAR FROM Date) AS Year,

SUM(Sales_Amount) AS Total_Sales

FROM

Sales_Data

GROUP BY

EXTRACT(YEAR FROM Date)

ORDER BY

EXTRACT(YEAR FROM Date);

This query aggregates sales data on a yearly basis to showcase the total sales for each year.

Conclusion
Analyzing sales data through the lens of time series in SQL allows businesses to extract meaningful insights regarding seasonal trends, growth rates, and potential future performance. These SQL functionalities enable businesses to make informed decisions, optimize inventory, and strategize marketing efforts based on historical sales patterns. While these examples showcase basic SQL operations for time series analysis, more advanced techniques and predictive models might involve integrating SQL with other statistical tools or programming languages. Nonetheless, SQL stands as a powerful tool for uncovering valuable insights from time-based sales data.

*/

create database sales
use sales
Create table SalesData(
	Data Date,
    SalesAmount decimal(10,2)
    );

INSERT INTO SalesData (Data, SalesAmount)
VALUES 
    ('2024-10-01', 1500.50),
    ('2024-10-02', 1200.75),
    ('2024-10-03', 1700.00),
    ('2024-10-04', 900.25),
    ('2024-10-05', 1300.00);
select * from SalesData;
INSERT INTO SalesData (Data, SalesAmount)
VALUES 
    ('2024-10-01', 1500.50),
    ('2024-10-02', 1200.75),
    ('2024-10-03', 1700.00),
    ('2024-10-04', 900.25),
    ('2024-10-05', 1300.00);
INSERT INTO SalesData (Data, SalesAmount)
VALUES 
    ('2024-10-01', 1500.50),
    ('2024-10-02', 1200.75),
    ('2024-10-03', 1700.00),
    ('2024-10-04', 900.25),
    ('2024-10-05', 1300.00);
select * from SalesData;
select sum(SalesAmount) as TotalAmount
from SalesData;
select avg(SalesAmount) as AvgAmount
from SalesData;
select Data Date,SalesAmount
from SalesData
where SalesAmount=(
		select max(SalesAmount)
        from SalesData
        );
select Data Date,SalesAmount,
	avg(SalesAmount) over (order by Data rows between 3 preceding and current row) as RollingAverage
	from SalesData;

select month(data) as MonthNumber,
	 sum(SalesAmount) as WeeklySales
From SalesData
Group by month(Data)
Order by MonthNumber;