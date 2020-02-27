-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no
LIMIT 3;

-- 2. List employees who were hired in 1986.

SELECT first_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986
LIMIT 3;

-- 3. List the manager of each department with the following information: 
-- department number, department name,
-- the manager's employee number, last name, first name,
-- and start and end employment dates.

SELECT departments.dept_no, dept_name, employees.emp_no, last_name, first_name, hire_date, to_date
FROM employees, dept_manager, departments
WHERE dept_manager.emp_no = employees.emp_no
AND departments.dept_no = dept_manager.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees, dept_emp, departments
WHERE dept_emp.emp_no = employees.emp_no
AND departments.dept_no = dept_emp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees, dept_emp, departments
WHERE dept_emp.emp_no = employees.emp_no
AND departments.dept_no = dept_emp.dept_no
AND dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees, dept_emp, departments
WHERE dept_emp.emp_no = employees.emp_no
AND departments.dept_no = dept_emp.dept_no
AND (dept_name = 'Sales' OR dept_name = 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;