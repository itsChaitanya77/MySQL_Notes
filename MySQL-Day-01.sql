/*
What is MySQL?

MySQL is an open-source Relational Database Management System (RDBMS) that is used to store, manage, and retrieve data using SQL (Structured Query Language).

It stores data in the form of tables with rows and columns and allows users to perform operations like creating databases, inserting data, updating records, deleting data, and retrieving information.
/*
============================================================
1. CONSTRAINTS
============================================================

Definition:
Constraints are rules applied to columns to maintain data
accuracy, integrity and consistency.

Types:
1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. CHECK
6. DEFAULT
*/


-- UNIQUE Constraint
/*
Definition:
UNIQUE constraint ensures that all values in a column are
different. Duplicate values are not allowed.
*/

-- create table products(
-- prod_id int,
-- prod_name VARCHAR(25) UNIQUE,
-- price decimal(4,2)
-- );


-- NOT NULL Constraint
/*
Definition:
NOT NULL ensures a column cannot store NULL values.
*/

-- alter table products
-- modify price decimal(4,2) NOT NULL;



-- CHECK Constraint
/*
Definition:
CHECK constraint validates data before inserting it.
The value must satisfy the given condition.
*/

-- create table products(
-- prod_id int,
-- prod_name varchar(25),
-- price decimal(4,2),
-- constraint chk_price check(price>10)
-- );


-- Drop Check Constraint
-- alter table products drop check chk_price;



-- DEFAULT Constraint
/*
Definition:
DEFAULT assigns a value automatically when no value
is provided.
*/

-- create table transactions(
-- transaction_id int,
-- amount decimal(5,2),
-- transaction_time datetime default now()
-- );


/*
============================================================
2. TABLE CREATION AND INSERT
============================================================
*/

-- CREATE table employee_data(
-- emp_id int,
-- first_name VARCHAR(20),
-- last_name VARCHAR(20),
-- hourly_pay decimal(5,2),
-- hire_date DATE
-- );


-- insert into employee_data values
-- (1,"Nikhil","kohli",55.00,"2025-02-01"),
-- (2,"chaitanya","kavati",50.00,"2026-02-01"),
-- (3,"sharan","lade",52.00,"2026-01-01"),
-- (5,"krishna","ram",50.00,"2026-02-01");



/*
============================================================
3. PRIMARY KEY
============================================================

Definition:
Primary Key uniquely identifies every row in a table.

Properties:
- Unique
- Cannot contain NULL values
- Only one primary key per table

PRIMARY KEY = UNIQUE + NOT NULL
*/

-- create table transactions(
-- transaction_id int primary key,
-- amount decimal(5,2)
-- );


/*
============================================================
4. AUTO_INCREMENT
============================================================

Definition:
AUTO_INCREMENT automatically generates sequential numbers
for a column.

Usually used with Primary Keys.
*/

-- create table transactions(
-- transaction_id int primary key auto_increment,
-- amount decimal(5,2)
-- );


-- alter table transactions auto_increment=1000;



/*
============================================================
5. FOREIGN KEY
============================================================

Definition:
Foreign Key creates a relationship between two tables.

It references the Primary Key of another table.

Purpose:
- Maintains referential integrity
- Prevents invalid data
*/


-- create table transactions(
-- transaction_id int primary key,
-- amount decimal(5,3),
-- customer_id int,
-- foreign key(customer_id)
-- references customers(customer_id)
-- );




/*
============================================================
6. JOINS
============================================================

Definition:
JOIN combines rows from multiple tables using a related column.
*/


-- INNER JOIN
/*
Returns only matching rows from both tables.
*/

-- select c.first_name,t.transaction_id from customers c
-- join transactions t
-- on c.customer_id=t.customer_id;



-- LEFT JOIN
/*
Returns all rows from left table and matching rows
from right table.
If no match, NULL values appear.
*/


-- select *
-- from transactions t
-- left join customers c
-- on t.customer_id=c.customer_id;



-- RIGHT JOIN
/*
Returns all rows from right table and matching rows
from left table.
*/

-- select *
-- from transactions t
-- right join customers c
-- on t.customer_id=c.customer_id;



-- SELF JOIN
/*
Definition:
A SELF JOIN joins a table with itself . it is very useful when rows in the
same table have a relationship with each other.

Used for:
Employee-manager relationships.
*/


-- alter table employee_data add supervisor_id int;

-- update employee_data
-- set supervisor_id=1
-- where emp_id=2;
-- update employee_data
-- set supervisor_id=2
-- where emp_id=3;

-- update employee_data
-- set supervisor_id=2
-- where emp_id=3;


SELECT * from employee_data;


-- select a.first_name,
-- b.first_name as supervisor
-- from employee_data a
-- left join employee_data b
-- on a.supervisor_id=b.emp_id;



/*
============================================================
7. FUNCTIONS
============================================================

Definition:
Functions are reusable blocks of code that perform an
operation and return a value.

Types:
1. Scalar Functions
2. Aggregate Functions
*/


/*
Aggregate Functions:

Definition:
Works on multiple rows and returns one single result.

Examples:
SUM()
COUNT()
AVG()
MIN()
MAX()
*/


-- select sum(amount) from transactions;
-- select count(amount) from transactions;
-- select avg(amount) from transactions;
-- select max(amount) from transactions;
-- select min(amount) from transactions;



/*
Scalar Functions:

Definition:
Works on one row at a time and returns one value
for each row.

Examples:
CONCAT()
UPPER()
LOWER()
LENGTH()
ROUND()
*/


-- select concat(first_name," ",last_name)
-- from customers;



/*
============================================================
8. OPERATORS
============================================================
*/


/*
AND:
Both conditions must be true.
*/


-- select *
-- from employee_data
-- where job="manager"
-- and hire_date < "2025-02-05";



/*
OR:
At least one condition must be true.
*/


-- select *
-- from employee_data
-- where job="manager"
-- or job="data scientist";



/*
NOT:
Reverses a condition.
*/


-- select *
-- from employee_data
-- where not job="Teacher";



/*
BETWEEN

Definition:
Checks values within a range.

It is inclusive.
*/


-- select *
-- from employee_data
-- where hire_date between "2025-01-02"
-- and "2026-02-02";



/*
IN Operator

Definition:
Membership operator.
Checks whether a value exists in a list.
*/


-- select *
-- from employee_data
-- where job in
-- ("manager","data scientist","software engineer");



/*
LIKE Operator & Wildcards

Definition:
Used for pattern matching.

% = multiple characters 
_ = single character
*/


-- select *
-- from employee_data
-- where job like "d%";

--Wild card characters & _
--used to substitute one or more characters in a string 

-- select * from employee_data
-- where job like "d%";

-- select * from employee_data where first_name like "%ya";

-- SELECT * from employee_data where hire_date like "____-__-02";

-- SELECT * from employee_data where job like "_a % "



/*
============================================================
9. ORDER BY
============================================================

Definition:
ORDER BY sorts the result in ascending(ASC) or descending(DESC) order.
*/


-- select *
-- from employee_data
-- order by first_name;


-- select *
-- from employee_data
-- order by first_name desc;



/*
============================================================
10. LIMIT
============================================================

Definition:
LIMIT restricts the number of rows returned.

Used for pagination.
*/

-- select * from employee_data limit 1;

-- select * from employee_data order by first_name ASC LIMIT 1;

-- select * from employee_data order by last_name DESC LIMIT 1;

-- select * from employee_data limit 10; 
-- select * from employee_data limit 1,1;  offset



/*
============================================================
11. UNION
============================================================

Definition:
Combines results of multiple SELECT statements.

UNION:
Removes duplicates.

UNION ALL:
Keeps duplicates.
*/


-- select first_name,last_name from employee_data
-- UNION
-- select first_name,last_name from customers;



/*
============================================================
12. VIEW
============================================================

Definition:
A VIEW is a virtual table based on result of sql query 
It stores the query rather than the data and is used to simplify queries,
improve security, and present data in a customized way.

It stores the query, not the actual data.

Advantages:
- Simplifies complex queries
- Improves security
- Reusable
*/


-- create view customer_details as select first_name,last_name from customers;

-- select * from customer_details;


