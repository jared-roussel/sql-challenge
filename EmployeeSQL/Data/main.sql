CREATE TABLE department (dept_no VARCHAR PRIMARY KEY
						 , dept_name VARCHAR);
						 
						 
						 
DROP TABLE department;
select * from department;

CREATE TABLE dept_emp (
	--id serial PRIMARY KEY,
  emp_no VARCHAR NOT NULL,
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);


					  
select * from dept_emp;
DROP TABLE dept_emp;