select * from employee_demographics;

#  Display the first name, last name, and age of every employee.
select first_name , last_name , age 
from employee_demographics;

# Display all employees who are older than 40.
select * from employee_demographics
where age > 40;

# Find all female employees.
select * from employee_demographics
where gender = 'female';

# Display employees sorted by age from oldest to youngest.
select * from employee_demographics
order by age DESC;

# Count how many employees are male and how many are female.
select gender , count(*)
from employee_demographics
group by gender;

# Find employees whose first name starts with the letter 'A'.
select first_name from employee_demographics
where first_name like 'a%';

# Display employees born after January 1, 1990. 


select birth_date from employee_demographics
where birth_date > '1990-01-01';

# Show every unique occupation.
select distinct occupation from employee_salary; 

# Find the highest salary in the company. 


select max(salary) as max_salary
from employee_salary;

# Find the average salary in the company 
select avg(salary)  as avg_sal
from employee_salary

