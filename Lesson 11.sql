-- 1. В таблице month_names создайте новое поле month_name_de для хранения названий месяцев на немецком языке.
-- Заполните это поле соответствующими значениями (названиями месяцев на немецком).

alter table month_names
add month_name_de varchar(60);

select * from month_names;

set sql_safe_updates = 0;

update month_names
set month_name_de = case
						when month_id = 1 then 'Januar'
                        when month_id = 2 then 'Februar'
                        when month_id = 3 then 'März'
                        when month_id = 4 then 'April'
                        when month_id = 5 then 'Mai'
                        when month_id = 6 then 'Juni'
                        when month_id = 7 then 'Juli'
                        when month_id = 8 then 'August'
                        when month_id = 9 then 'September'
                        when month_id = 10 then 'Oktober'
                        when month_id = 11 then 'November'
                        when month_id = 12 then 'Dezember'
					end;

-- Вывести список сотрудников, нанятых в последний месяц каждого года.
select first_name, last_name, hire_date
from employees
where month(hire_date) = 12;

-- Показать всех сотрудников, нанятых в выходные.
select first_name, last_name, hire_date
from employees
where dayofweek(hire_date) = 1 or dayofweek(hire_date) = 7; -- 1 - воскресенье , 7 - суббота
-- where dayofweek(hire_date) in (1, 7)

-- Найти сотрудников, которые были наняты более 10 лет назад и чья зарплата ниже 5000.
select first_name, last_name, hire_date
from employees
where ((year(now()) - year(hire_date) > 10) or (year(now()) - year(hire_date) = 10 and month(now()) > month(hire_date)))
and salary < 5000;

-- Показать сотрудников с зарплатой выше 8000, которых приняли на работу в 1994 году.
-- Выведите полные имена(в одном поле) и зарплаты всех сотрудников, добавив к зарплате символ "$".
select concat(first_name, ' ', last_name) as full_name, concat(salary, '$') as salary
from employees
where salary > 8000 and year(hire_date) = 1994;


-- Агрегатные функции

-- min - вычисляет наименьшее значение
-- max - вычисляет наибольшее значение
-- sum - вычисляет сумму значений
-- count - вычисляет количество строк в запросе
-- avg - вычисляет среднее значение

-- Все агрегатные функции за исключением COUNT(*) игнорируют значения NULL.

-- https://github.com/NelliEfr/hr_data/blob/master/script.sql
use hr;
select * from employees;

-- Вывести максимальную зарплату в компании
select max(salary)
from employees;

-- ОШИБКА
-- select max(salary), first_name, last_name
-- from employees;

-- select min(salary), first_name, last_name
-- from employees;

-- Вывести минимальную и максимальную зарплату в компании
select min(salary), max(salary)
from employees;

-- Вывести сумму всех зарплат 
select sum(salary)
from employees;

-- Вывести среднее значение поля salary
select avg(salary)
from employees;

select sum(salary)/count(employee_id)
from employees;

-- Вывести кол/во сотрудников в компании 
select count(employee_id)
from employees;

-- Вывести кол/во строк таблицы employees
select count(*)
from employees;

-- Вывести всех сотрудников из деп. IT
select t1.first_name, t1.last_name
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'IT';

-- вывести кол/во сотрудников из деп. IT
select count(*)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'IT';

select count(t1.employee_id)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'IT';

-- Вывести сумму зарплат сотрудников из деп. Sales
select sum(t1.salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Sales';

-- Найти средную зарплату сотрудников из 'United States of America'(country_name)
select avg(salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
join countries t4
on t3.country_id = t4.country_id
where t4.country_name = 'United States of America';

-- Подзапросы - SubSelect

-- select column1, column2
-- from table1
-- where column1 = (select aggregate(column) from table1);

-- Вывести имя и фамилию сотрудников с маскимальной зарплатой
-- 1. Вывести максимальную зп в компании.
select max(salary)
from employees;

select first_name, last_name
from employees
where salary = (select max(salary)
				from employees);
                
-- select first_name, last_name
-- from employees
-- where salary = max(salary);        
-- Error Code: 1111. Invalid use of group function	0.000 sec

-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании
-- Вывести имя, фамилию и зарплату.

-- Вывести среднюю зп в компании
select avg(salary) 
from employees;

select first_name, last_name, salary
from employees
where salary < (select avg(salary) from employees);

-- Вывести сотрудников(first_name, last_name, salary) с дольжностью(job_title) Programmer,
-- которые получают больше средней зарплаты всех сотрудников. 

-- Вывести среднюю зп в компании
select avg(salary) 
from employees;

select t1.first_name, t1.last_name, t1.salary 
from employees t1
join jobs t2
on t1.job_id = t2.job_id
where t2.job_title = 'Programmer' and t1.salary > (select avg(salary) from employees);

-- Вывести список сотрудников с должностью 'Programmer', 
-- чья зарплата выше средней зарплаты среди всех сотрудников с этой должностью.

-- 1. Вывести среднюю зп сотрудников с должностью 'Programmer'
select avg(t1.salary)
from employees t1
join jobs t2
on t1.job_id = t2.job_id
where t2.job_title = 'Programmer';

select t1.first_name, t1.last_name, t1.salary
from employees t1
join jobs t2
on t1.job_id = t2.job_id
where t2.job_title = 'Programmer' and t1.salary > (select avg(t1.salary)
													from employees t1
													join jobs t2
													on t1.job_id = t2.job_id
													where t2.job_title = 'Programmer');
