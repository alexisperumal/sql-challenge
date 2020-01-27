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


-------------------------------------------------------------------------------
-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, last_name, first_name, gender, salaries.salary, from_date, to_date FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no ASC
LIMIT 10;

-- 2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986_12-31' ORDER BY emp_no LIMIT 10;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY departments.dept_no, dept_manager.from_date
LIMIT 10;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
LIMIT 10;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
ORDER BY employees.emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY employees.emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) FROM employees GROUP BY last_name ORDER BY COUNT(last_name) DESC;

-- I'm curious what the most common first names are in the dataset...
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name ORDER BY COUNT(first_name) DESC;

-- Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you
-- for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge
-- to see that your employee ID number is 499942.
SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no = 499942
ORDER BY employees.emp_no;