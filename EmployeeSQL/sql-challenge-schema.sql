-- UCSD Data Science Bootcamp - SQL HW
-- Alexis Perumal, 1/26/20

-------------------------------------------------------------------------------
-- Create Tables

-- 1. dept_manager
DROP TABLE dept_manager;

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no BIGINT,
	from_date DATE,
	to_date DATE
);

COPY dept_manager FROM '/Users/aperumal/OneDrive/Personal/UCSD_Data_Science_Bootcamp/Homework/2020-01-26_HW7_SQL/sql-challenge/EmployeeSQL/data/dept_manager.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM dept_manager;


-- 2. department
DROP TABLE departments;

CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

COPY departments FROM '/Users/aperumal/OneDrive/Personal/UCSD_Data_Science_Bootcamp/Homework/2020-01-26_HW7_SQL/sql-challenge/EmployeeSQL/data/departments.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM departments;


-- 3. dept_emp
DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	emp_no BIGINT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE
);

COPY dept_emp FROM '/Users/aperumal/OneDrive/Personal/UCSD_Data_Science_Bootcamp/Homework/2020-01-26_HW7_SQL/sql-challenge/EmployeeSQL/data/dept_emp.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM dept_emp;


-- 4. employees
DROP TABLE employees;

CREATE TABLE employees (
	emp_no BIGINT,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR(1),
	hire_date DATE
);

COPY employees FROM '/Users/aperumal/OneDrive/Personal/UCSD_Data_Science_Bootcamp/Homework/2020-01-26_HW7_SQL/sql-challenge/EmployeeSQL/data/employees.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM employees WHERE hire_date = '1989-07-24' ORDER BY birth_date DESC;


-- 5. salaries
DROP TABLE salaries;

CREATE TABLE salaries (
	emp_no BIGINT,
	salary BIGINT,
	from_date DATE,
	to_date DATE
);

COPY salaries FROM '/Users/aperumal/OneDrive/Personal/UCSD_Data_Science_Bootcamp/Homework/2020-01-26_HW7_SQL/sql-challenge/EmployeeSQL/data/salaries.csv'
DELIMITER ',' CSV HEADER;

SELECT COUNT(*) FROM salaries;


-- 6. salaries
DROP TABLE titles;

CREATE TABLE titles (
	emp_no BIGINT,
	title VARCHAR,
	from_date DATE,
	to_date DATE
);

COPY titles FROM '/Users/aperumal/OneDrive/Personal/UCSD_Data_Science_Bootcamp/Homework/2020-01-26_HW7_SQL/sql-challenge/EmployeeSQL/data/titles.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM titles LIMIT 10;
