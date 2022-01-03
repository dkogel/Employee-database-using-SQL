
--DATA ANALYSIS--

--Queries employee number, last name, first name, sex, and salary of each employee

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on 
employees.emp_no=salaries.emp_no
;

--Queries first name, last name, and hire date for employees who were hired in 1986.


select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31'
;

--Queries the manager of each department and provides the  the following information:
--department number, department name, the manager's employee number, last name, first name.


select departments.dept_no, departments.dept_name, dept_manager.emp_no,
		employees.first_name, employees.last_name 
from departments
inner join dept_manager on departments.dept_no= dept_manager.dep_no
inner join employees on dept_manager.emp_no= employees.emp_no;


--Queries the department of each employee with the following information:
--employee number, last name, first name, and department name.

select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
inner join department_emp on employees.emp_no= department_emp.emp_no
inner join departments on department_emp.dept_no= departments.dept_no;

-- Queries first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees 
where first_name = 'Hercules' and last_name like 'B%';



-- Queries all employees in the Sales department,
-- and provies their employee number, last name, first name, and department name.
-- sales dept_no is d007

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_emp on employees.emp_no= department_emp.emp_no
inner join departments on department_emp.dept_no= departments.dept_no
where departments.dept_no= 'd007';

-- Queries all employees in the Sales and Development department,
-- provides their employee number, last name, first name, and department name.
-- sales dept_no is d007 development is d005 

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_emp on employees.emp_no= department_emp.emp_no
inner join departments on department_emp.dept_no= departments.dept_no
where departments.dept_no= 'd007' or departments.dept_no= 'd005' ;

--Lists the frequency count of employee last names in descending order
--Said another way, lists how many employees share the same last name.

select last_name, count(last_name) as "name_count"
from employees
group by last_name
order by name_count desc;


