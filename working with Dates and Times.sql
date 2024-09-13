/*Introduction to Working with Dates and Times:
Dates and times are integral components of many databases, allowing us to track events, schedule tasks, and analyze temporal data. SQL (Structured Query Language) offers powerful functionalities to manipulate, query, and manage date and time information within databases. Understanding these operations is crucial for efficient data handling. Let’s delve into the various aspects of working with dates and times in SQL.

Date and Time Data Types in SQL
SQL databases typically provide specific data types to handle dates and times:

1. DATE
Stores date values in the format YYYY-MM-DD.

2. TIME
Stores time values in the format HH:MI:SS.

3. DATETIME/TIMESTAMP
Stores both date and time values.

4. INTERVAL
Represents a duration of time, allowing operations like adding or subtracting time intervals.

Basic Operations with Dates and Times
1. Retrieving Current Date and Time
SELECT CURRENT_DATE; -- Retrieves current date

SELECT CURRENT_TIME; -- Retrieves current time

SELECT CURRENT_TIMESTAMP; -- Retrieves current date and time

2. Extracting Components
Extracting specific components (year, month, day, etc.) from date or time values:

SELECT EXTRACT(YEAR FROM date_column) AS year;

SELECT EXTRACT(MONTH FROM date_column) AS month;

SELECT EXTRACT(DAY FROM date_column) AS day;

-- Similarly for TIME: EXTRACT(HOUR FROM time_column), EXTRACT(MINUTE FROM time_column), etc.


3. Manipulating Dates
Performing arithmetic operations on dates:

SELECT DATE_ADD(date_column, INTERVAL 1 DAY) AS next_day;

SELECT DATE_SUB(date_column, INTERVAL 1 MONTH) AS last_month;


4. Date Formatting
Converting date or time values to specific formats:

SELECT DATE_FORMAT(date_column, 'YYYY/MM/DD') AS formatted_date;

SELECT DATE_FORMAT(time_column, 'HH:MI:SS') AS formatted_time;

Examples of Working with Dates and Times
Let’s consider a scenario using an imaginary 'events' table:

1. Retrieve Events After a Specific Date
SELECT * FROM events WHERE event_date > '2023-01-01';

2. Calculate Age from Birthdate
Assuming 'birthdate' column holds the date of birth:

SELECT name, FLOOR(DATEDIFF(CURRENT_DATE, birthdate) / 365) AS age FROM users;

3. Filtering Events within a Time Range
SELECT * FROM events WHERE event_time BETWEEN '09:00:00' AND '17:00:00';

4. Calculate Duration Between Two Date-Times
Assuming 'start_time' and 'end_time':

SELECT TIMEDIFF(end_time, start_time) AS duration FROM schedule;


Working with dates and times in SQL involves various operations from simple retrievals to complex calculations. Mastery of these functionalities empowers efficient data handling, analysis, and reporting within databases. Remembering the nuances and best practices allows for accurate and effective utilization of date and time-related data in SQL.
*/

create database datetime;
use datetime;
create table events(
	event_id int primary key,
    event_name varchar(250),
    event_date date
    );

INSERT INTO events (event_id, event_name, event_date)
VALUES
    (1, 'Tech Conference', '2024-10-15'),
    (2, 'Music Festival', '2024-09-20'),
    (3, 'Art Expo', '2024-11-05'),
    (4, 'Food Fest', '2024-12-10');

select 
	event_name,
	year(event_date) as event_year,
    month(event_date) as event_month
from events;

CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    appointment_desc VARCHAR(255),
    appointment_time TIME
);

INSERT INTO appointment (appointment_id, appointment_desc, appointment_time)
VALUES
    (1, 'Doctor Visit', '10:30:00'),
    (2, 'Business Meeting', '14:00:00'),
    (3, 'Interview', '09:00:00'),
    (4, 'Lunch with Client', '12:30:00');

select 
	appointment_desc,
	year(appointment_time) as appointment_time
from appointment;

CREATE TABLE scheduledtasks (
    task_id INT PRIMARY KEY,
    task_name VARCHAR(255),
    task_datetime datetime
);

INSERT INTO scheduledtasks (task_id, task_name, task_datetime)
VALUES
    (1, 'Team Meeting', '2024-09-15 10:00:00'),
    (2, 'Project Deadline', '2024-09-20 17:00:00'),
    (3, 'Client Presentation', '2024-09-25 14:30:00'),
    (4, 'Code Review', '2024-09-30 11:00:00');

select 
	task_name,
    timestamp(task_datetime) as task_date
from scheduledtasks;

select now();
select curdate();

select 
	task_name,
    task_datetime,
    datediff(task_datetime,now()) as DaysUntilDeadline
from
	scheduledtasks;
