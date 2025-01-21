-- CRUD

-- CREATE - database, tables
-- READ - select
-- UPDATE - alter table, update
-- DELETE - drop database, drop table, delete from, drop column


select * from employees;

-- Из таблицы employees вывести имена и фамилии сотрудников, которые получают больше 10000 и 
-- работают в департаментах с id 100, 60, 110.
select first_name, last_name
from employees
where salary > 10000 and department_id in (100, 60, 110);

-- Из таблицы employees вывести имена, фамилии, зарплаты и комисси сотрудников, у которых зарплата меньше 10000 и нет комиссии.
select first_name, last_name, salary, commission_pct
from employees
where salary < 10000 and commission_pct is null; 
-- where salary < 10000 and (commission_pct is null or commission_pct = 0);

-- Вывести имена, фамилии и зарплаты первых 3 сотрудников с зарплатой выше 10000. 
select first_name, last_name, salary
from employees
where salary > 10000
limit 3;

-- limit N - N кол/во строк которое нужно вывести
-- limit M, N - M кол/во строк которое нужно пропустить, N кол/во строк которое нужно вывести

-- Вывести первых двух сотрудников с самыми низкими зарплатами.
select first_name, last_name, salary
from employees
order by salary
limit 2;

-- Вывести имена, фамилии сотрудников и названия департаментов.
select emp.first_name, emp.last_name, dep.department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id;

-- min(column(int/numeric/decimal)), max(column(int/numeric/decimal)), sum(column(int/numeric/decimal)),
-- avg(column(int/numeric/decimal)), count(*/column)

-- group by
-- having

-- Вывести те департаменты, в которых максимальная зарплата выше 10000.
select dep.department_name, max(emp.salary) as max_salary
from departments dep
join employees emp
on dep.department_id = emp.department_id
group by dep.department_name
having max_salary > 10000;

-- Вывести те департаменты, где кол/во сотрудников больше 3.
select dep.department_name, count(emp.employee_id) as emp_count
from departments dep
join employees emp
on dep.department_id = emp.department_id
group by dep.department_name
having emp_count > 3;

select department_name
from departments dep
join (select department_id, count(employee_id) as emp_count
		from employees
		group by department_id
		having emp_count > 3) emp_count_table
on dep.department_id = emp_count_table.department_id;
