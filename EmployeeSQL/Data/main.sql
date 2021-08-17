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

--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
ON (e.emp_no = s.emp_no)
;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
--WHERE hire_date LIKE '1986%';
WHERE CAST(hire_date AS VARCHAR) LIKE '1986%';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.



SELECT d.dept_no, d.dept_name, dm.emp_no --, e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments as d
ON (d.dept_no = dm.dept_no)
;

SELECT d.dept_no, d.dept_name, dm.emp_no , e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments as d ON (d.dept_no = dm.dept_no)
JOIN employees as e ON (e.emp_no = dm.emp_no)
;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name--, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON CAST (e.emp_no AS VARCHAR) = de.emp_no;
--JOIN employees as e ON (e.emp_no = dm.emp_no)
;


--List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT emp_no, last_name, first_name, dept_name
FROM employees
JOIN departments ON 

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as "Frequency Count of Employee Last Name" 
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count of Employee Last Name" DESC;














