# 1. Display employee names along with their salary.
select s.first_name , s.last_name , s.salary
from employee_demographics as d 
	right join employee_salary as s 
on d.employee_id = s.employee_id ;

# 2. Find employees earning more than the average salary.

select * 
from employee_salary
where salary > (select avg(salary) as avg_sal
				from employee_salary);
                
# 3. Find the number of employees in each department.
select pd.department_name , count(*) as employee_count
from employee_salary as es
join parks_departments as pd 
	on es.dept_id = pd.department_id
group by department_name;

# 4. Find departments having more than one employee.

select pd.department_name , count(*) as employee_count
from employee_salary as es
join parks_departments as pd 
	on es.dept_id = pd.department_id
group by department_name
having employee_count > 1;

# 5. Display employees whose occupation contains the word "Director".
select employee_id , first_name , occupation 
from employee_salary
where occupation like '%Director%';

# 6. Display employees ordered by salary (highest first).
select first_name , salary 
from employee_salary
order by salary desc;

# 7. Display employees whose salary is between 50,000 and 70,000.

select first_name , salary 
from employee_salary
where salary between 50000 and 70000; # (>= a AND <= b )

# 8 Count employees in each age.
select age , count(*) as total 
from employee_demographics
group by age;

# 9. Display employees along with a column named salary_category.
# Rules:
# Salary ≥ 70000 → High
# Salary between 50000 and 69999 → Medium
# Otherwise → Low

select first_name , salary, 
	CASE
		when salary >= 70000 then 'high'
		when salary between 50000 and 69999 then 'medium' 
		else 'low'
	end as salary_category
from employee_salary;

# 10. Display employees whose last name ends with 'n'.
select employee_id , first_name , last_name 
from employee_salary
where last_name like '%n';

# 11. Display the youngest employee.
select employee_id , first_name, age 
from employee_demographics
where age = (select min(age) as young 
			 from employee_demographics);

# 12. Find employees who belong to the Parks department.
select es.employee_id , es.first_name , pd.department_name  
from employee_salary as es
join parks_departments as pd
	on es.dept_id = pd.department_id
where department_name like '%Parks%';

# 13. Display employees whose salary is NULL.
select employee_id ,  first_name 
from employee_salary
where salary is null;

# 14. Find the total salary paid by each department.

select pd.department_name , sum(salary) as total_salary
from employee_salary as es
join parks_departments as pd
	on es.dept_id = pd.department_id 
group by department_name;





