--Create the title table and import titles.csv
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

select * from titles;

--Create employees table and import employees.csv
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

select * from employees;

--DROP TABLE employees;


--Create salaries table and import salaries.csv
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from salaries;

--Create department manager table and import dept_manager.csv
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

select * from dept_manager;


--Create departments and import departments.csv
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

select * from departments;

--drop table departments;


--Create department emp table and import dept_emp.csv
CREATE TABLE dept_emp (
	dept_no VARCHAR,
	emp_no VARCHAR,
	--FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

select * from dept_emp;

--drop table dept_emp;





































