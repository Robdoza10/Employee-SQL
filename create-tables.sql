DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE employees(
  emp_no INT PRIMARY KEY,
  birth_date DATE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  gender CHAR(1),
  hire_date DATE
);

CREATE TABLE departments(
  dept_no CHAR(4) PRIMARY KEY,
  dept_name VARCHAR(255)
);

CREATE TABLE dept_emp(
  emp_no INT,
  dept_no CHAR(4),
  from_date DATE,
  to_date DATE,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
  dept_no CHAR(4),
  emp_no INT,
  from_date DATE,
  to_date DATE,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE titles(
  emp_no INT,
  title VARCHAR(255),
  from_date DATE,
  to_date DATE,
  PRIMARY KEY (emp_no, title, from_date),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
  emp_no INT PRIMARY KEY,
  salary INT,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

