List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON
e.emp_no = s.emp_no;


List employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date>='1986-01-01' AND hire_date<='1986-12-31';


List the manager of each department with the following information: department number, department name, the managers employee number, last name, first name, and start and end employment dates


SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name, e.hire_date
FROM departments AS d
  JOIN dept_manager AS m
  ON (d.dept_no = m.dept_no)
    JOIN employees AS e
    ON (e.emp_no = m.emp_no);


List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
	JOIN dept_manager AS m
	ON (m.emp_no = m.emp_no)
		JOIN departments AS d
    	ON (d.dept_no = m.dept_no)
GROUP BY d.dept_name, e.emp_no;
		


List all employees whose first name is "Hercules" and last names begin with "B."


SELECT first_name, last_name
FROM employees
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';



List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
	JOIN dept_manager AS m
	ON (e.emp_no = m.emp_no)
		JOIN departments AS d
    	ON (d.dept_no = m.dept_no)


List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
	JOIN dept_manager AS m 
	ON (e.emp_no = m.emp_no)
		JOIN departments AS d
    	ON (d.dept_no = m.dept_no)
			WHERE 
				d.dept_name = 'Sales'
				OR d.dept_name = 'Development';


In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT e.last_name, count(e.last_name) as number_of_names
FROM employees AS e
GROUP BY e.last_name
ORDER BY number_of_names desc;


