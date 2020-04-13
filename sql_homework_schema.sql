DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR(10)   NOT NULL,
    dept_name VARCHAR(55)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

ALTER TABLE departments
    ALTER COLUMN dept_no TYPE VARCHAR USING dept_no::varchar;

ALTER TABLE dept_emp
    ALTER COLUMN dept_no TYPE VARCHAR USING dept_no::varchar;


DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no
     )
);

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no
     )
);

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(55)   NOT NULL,
    last_name VARCHAR(55)    NOT NULL,
    gender VARCHAR(55)    NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

DROP TABLE IF EXISTS salaries;

SELECT *
FROM dept_emp;


CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    emp_no INTEGER   NOT NULL,
    title VARCHAR(55)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_from_date FOREIGN KEY(from_date)
REFERENCES dept_manager (from_date);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_from_date FOREIGN KEY(from_date)
REFERENCES dept_manager (from_date);
