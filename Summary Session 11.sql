-- 1. Найти общее количество департаментов в компании.
select count(department_id)
from departments;

-- 2. Вывести имена и фамилии сотрудников с максимальной и минимальной зарплатой.
select max(salary) from employees;
select min(salary) from employees;

select first_name, last_name, salary
from employees
where salary = (select max(salary) from employees) or salary = (select min(salary) from employees);

-- 3. Найти самую низкую и самую высокую зарплату среди сотрудников с должностями IT_PROG и ST_MAN.
select max(salary), min(salary)
from employees
where job_id in ('IT_PROG', 'ST_MAN');

-- 4. Вывести имя, фамилию, зарплату и название департамента сотрудника с максимальной зарплатой в компании.
select first_name, last_name, salary, department_name
from employees t1
join departments t2
on t1.department_id = t2.department_id
where salary = (select max(salary) from employees);

-- 5. Найти самую большую зарплату среди сотрудников, работающих в департаментах с ID 70 и 80.
select max(salary)
from employees
where department_id in (70, 80);

-- Найти максимальные зарплаты среди сотрудников, работающих в департаментах с ID 70 и 80.
select salary, department_id
from employees
where (salary = (select max(salary) from employees where department_id = 70) and department_id = 70)
or (salary = (select max(salary) from employees where department_id = 80) and department_id = 80);

-- 6. Найти среднюю зарплату в департаменте с ID 90.
select avg(salary)
from employees 
where department_id = 90;

-- 7. Найти количество сотрудников из департамента с ID 100, которые зарабатывают более 5000.
select count(*) as emp_count
from employees
where department_id = 100 and salary > 5000;

-- 8. Найти количество сотрудников из департамента с ID 60, которые зарабатывают больше средней зарплаты по компании.
select count(*)
from employees
where department_id = 60 and salary > (select avg(salary) from employees);

-- 9. Найти количество департаментов, в которых никто не работает.
select count(*)
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.employee_id is null;

-- 10. Найти количество сотрудников из департамента IT, которые зарабатывают больше средней зарплаты по компании.
select count(*)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'IT' and t1.salary > (select avg(salary) from employees);
