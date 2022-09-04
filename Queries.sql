-- Data Analysis

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no,e.first_name,e.last_name,e.sex, s.salary 
from employees e
  join salaries s
  on (e.emp_no = s.emp_no);


-- List first name, last name, and hire date for employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date
from employees e
where 
	right(hire_date, 4)='1986';


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select m.dept_no,m.emp_no,e.first_name,e.last_name,d.dept_name
from dept_manager m
 join employees e 
 on (m.emp_no=e.emp_no)
 join departments d 
 on (m.dept_no = d.dept_no);


-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select de.emp_no, e.first_name,e.last_name, d.dept_name
from dept_emp de
inner join employees e
	on (de.emp_no= e.emp_no)
inner join departments d
	on (de.dept_no= d.dept_no);	

 
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select e.first_name,e.last_name, e.sex
from employees e 
where 
	left(last_name,1) = 'B' 
	and
	first_name = 'Hercules';
	

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select de.emp_no, e.first_name,e.last_name, d.dept_name
from dept_emp de
inner join employees e
	on (de.emp_no= e.emp_no)
inner join departments d
	on (de.dept_no= d.dept_no)
where d.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.first_name,e.last_name, d.dept_name
from dept_emp de
inner join employees e
	on (de.emp_no= e.emp_no)
inner join departments d
	on (de.dept_no= d.dept_no)
where
    d.dept_name = 'Sales' 
	or
	d.dept_name = 'Development';
	

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

select e.last_name, count(e.last_name) as freq 
from employees e
group by e.last_name 
order by "freq" desc;
