--INDEX (B-Tree Data Structure)

An Index is used to find values within a specific column more quickly.

-- MySQL normally searches sequentially through a column. The longer the
column, the more expensive the operation becomes.

-- Benefits:

-- SELECT operations become faster
-- Searching becomes efficient

-- Drawback:

-- -   INSERT, UPDATE, and DELETE operations may take more time because the
-- index also needs to be updated.

-- Show Existing Indexes

SHOW INDEXES FROM customers;

It shows indexes present in a table, including the primary key index.

-- Creating an Index

CREATE INDEX last_name_idx 
ON customers(last_name);

-- Example:

SELECT * 
FROM customers 
WHERE last_name="vest";

-- This search becomes faster because of the index.

-- ------------------------------------------------------------------------

-- Multi-Column Index (Composite Index)

A Multi-Column Index is an index created on two or more columns.

-- It improves the performance of queries that filter or sort using
-- multiple columns together.

-- Example:

CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);

-- Query:

SELECT *
FROM customers
WHERE last_name="marley"
AND first_name="Bob";

-- ------------------------------------------------------------------------

-- Subquery

-- A subquery is a query written inside another query.

-- Example:

SELECT first_name,last_name 
FROM customers
WHERE customer_id IN 
-- (
SELECT DISTINCT customer_id 
FROM transactions
WHERE customer_id IS NOT NULL
-- );

-- Finding Employees Using Subqueries

-- Employees with salary greater than average salary:

SELECT first_name,last_name,hourly_pay
FROM employee_data
WHERE hourly_pay >
-- (
SELECT AVG(hourly_pay)
FROM employee_data
-- );

-- Employees with salary less than maximum salary:

SELECT *
FROM employee_data
WHERE hourly_pay <
-- (
SELECT MAX(hourly_pay)
FROM employee_data
-- );

-- Employee with highest salary:

SELECT *
FROM employee_data
WHERE hourly_pay =
-- (
SELECT MAX(hourly_pay)
FROM employee_data
-- );

-- Employee with lowest salary:

SELECT *
FROM employee_data
WHERE hourly_pay =
-- (
SELECT MIN(hourly_pay)
FROM employee_data
-- );

-- Employees earning more than Chaitanya:

SELECT *
FROM employee_data
WHERE hourly_pay >
-- (
SELECT hourly_pay
FROM employee_data
WHERE first_name="chaitanya"
-- );

-- ------------------------------------------------------------------------

-- GROUP BY

GROUP BY is used to group rows that have the same values in one or more
-- columns.

-- It works with aggregate functions:

-- -   SUM()
-- -   MAX()
-- -   MIN()
-- -   AVG()
-- -   COUNT()

-- Example:

SELECT job,
MAX(hourly_pay) AS highest_salary
FROM employee_data
GROUP BY job;

-- GROUP BY with Transactions

SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date;

SELECT MAX(amount), order_date
FROM transactions
GROUP BY order_date;

SELECT AVG(amount), order_date
FROM transactions
GROUP BY order_date;

Using HAVING:

SELECT COUNT(amount), order_date
FROM transactions
GROUP BY order_date
HAVING COUNT(amount)>1;

-- ------------------------------------------------------------------------

-- ROLLUP

ROLLUP is an extension of GROUP BY.

It creates an additional row that shows the grand total (super-aggregate
-- value).

-- Example:

SELECT COUNT(transaction_id) AS 'No of orders',
-- customer_id
FROM transactions
GROUP BY customer_id WITH ROLLUP;

-- Another example:

SELECT SUM(hourly_pay) AS 'Hourly Pay',
-- emp_id
FROM employee_data
GROUP BY emp_id WITH ROLLUP;

-- ------------------------------------------------------------------------
