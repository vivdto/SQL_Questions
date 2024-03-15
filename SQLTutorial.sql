-- Create a new database named myDB
CREATE DATABASE myDB;

-- Use the myDB database for subsequent operations
USE myDB;

-- Allow the myDB database to be modified
ALTER DATABASE myDB READ ONLY = 0;

-- Create a table named employees
CREATE TABLE employees (
    employee_id INT, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_paid DECIMAL(5,2),
    hire_date DATE
);

-- Display all records from the employees table
SELECT * FROM employees;

-- Rename the 'phone_number' column to 'email'
ALTER TABLE employees RENAME COLUMN phone_number TO email;

-- Modify the 'email' column to have a maximum length of 100 characters
ALTER TABLE employees MODIFY COLUMN email VARCHAR(100);

-- Display all records from the employees table after column modifications
SELECT * FROM employees;

-- Modify the 'email' column to have a maximum length of 100 characters after 'last_name'
ALTER TABLE employees MODIFY email VARCHAR(100) AFTER last_name;

-- Drop the 'email' column from the employees table
ALTER TABLE employees DROP COLUMN email;

-- Display all records from the employees table after column deletion
SELECT * FROM employees;

-- Insert new records into the employees table
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (1, 'Viv', 'Dto'), 
       (2, 'Viv', 'Dto'),
       (3, 'Viv', 'Dto'),
       (4, 'Viv', 'Dto');

-- Display all records from the employees table
SELECT * FROM employees;

-- Select only the 'first_name' and 'last_name' columns from the employees table
SELECT first_name, last_name FROM employees;

-- Select records where the 'first_name' is 'Viv'
SELECT * FROM employees WHERE first_name = 'Viv';

-- Interview-based questions:

-- Q1: How would you retrieve records where the hourly_paid is greater than or equal to a specific value?
-- A1: SELECT * FROM employees WHERE hourly_paid >= xx;

-- Q2: How would you retrieve records where the hourly_paid is less than or equal to a specific value?
-- A2: SELECT * FROM employees WHERE hourly_paid <= xx;

-- Q3: How would you retrieve records where the employee_id is not equal to 1?
-- A3: SELECT * FROM employees WHERE employee_id != 1;

-- Q4: How would you retrieve records where the hire_date is not NULL?
-- A4: SELECT * FROM employees WHERE hire_date IS NOT NULL;

-- Update the hourly_paid and hire_date for an employee with ID 6
UPDATE employees 
SET hourly_paid = 10.25,
    hire_date = '2023-01-07'
WHERE employee_id = 6;

-- Display all records from the employees table
SELECT * FROM employees;

-- Update the hourly_pay for all employees to 10.25
UPDATE employees 
SET hourly_paid = 10.25;

-- Display all records from the employees table
SELECT * FROM employees;

-- Delete the record for employee with ID 6
DELETE FROM employees WHERE employee_id = 6;

-- Disable autocommit to manually control transactions
SET autocommit = OFF;

-- Commit the changes made to the database
COMMIT;

-- Delete all records from the employees table
DELETE FROM employees;

-- Display all records from the employees table
SELECT * FROM employees;

-- Rollback the changes made, reverting to the previous state
ROLLBACK;

-- Display all records from the employees table
SELECT * FROM employees;

-- Create a new table named 'test' with different date and time data types
CREATE TABLE test (
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

-- Display all records from the 'test' table
SELECT * FROM test;

-- Insert a record into the 'test' table with a date value 3 days from the current date
INSERT INTO test
VALUES (CURRENT_DATE() + 3, NULL, NULL);

-- Display all records from the 'test' table
SELECT * FROM test;

-- Drop the 'test' table
DROP TABLE test;

-- Display all records from the 'table' (incorrect table name, should be 'employees')
SELECT * FROM table;


/*
How do you ensure that a database remains read-write and not read-only?

In SQL, you can ensure that a database remains read-write by setting its read-only property to 0 using the ALTER DATABASE statement. For example:

ALTER DATABASE myDB READ ONLY = 0;

This statement explicitly sets the read-only property of the database named myDB to false (0), allowing it to be modified.

Explain the difference between the VARCHAR and CHAR data types in SQL.

In SQL, both VARCHAR and CHAR are used to store character data, but they have differences in how they handle storage:

VARCHAR (Variable Character): It allows variable-length strings and only consumes storage space based on the actual length of the data. For example, a VARCHAR(100) column can store up to 100 characters, but it will use storage proportional to the actual length of the stored string.

CHAR (Fixed-length Character): It stores fixed-length strings and always consumes storage space equal to the specified length, padding the data with spaces if necessary. For example, a CHAR(100) column will always use 100 characters of storage, regardless of the actual length of the stored string.

What is the purpose of the COMMIT and ROLLBACK statements in SQL transactions?

COMMIT: The COMMIT statement is used to permanently save the changes made during a transaction to the database. It marks the end of a successful transaction, ensuring that all modifications are applied and become permanent.

ROLLBACK: The ROLLBACK statement is used to undo or cancel the changes made during a transaction. It reverts the database to its state before the transaction began, effectively discarding any changes made within the transaction.

How would you modify the structure of an existing table in SQL?

To modify the structure of an existing table in SQL, you can use the ALTER TABLE statement along with various clauses to perform actions such as adding, modifying, or dropping columns. For example:

Adding a column:

ALTER TABLE employees ADD COLUMN department VARCHAR(50);
Modifying a column:

ALTER TABLE employees MODIFY COLUMN hourly_paid DECIMAL(6,2);
Dropping a column:

ALTER TABLE employees DROP COLUMN department;
Can you explain the use of the autocommit mode in SQL transactions?

Autocommit mode in SQL determines whether each individual SQL statement is automatically committed as a separate transaction or if transactions must be explicitly committed using the COMMIT statement. 


When autocommit is enabled (autocommit = ON), each statement is automatically committed after execution. On the other hand, when autocommit is disabled (autocommit = OFF), transactions must be explicitly committed or rolled back using the COMMIT or ROLLBACK statements, respectively. 


Autocommit mode provides control over transaction boundaries and helps ensure data integrity by allowing multiple SQL statements to be grouped into a single transaction.

*/
