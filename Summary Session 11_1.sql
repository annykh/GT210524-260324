-- База HR - https://github.com/NelliEfr/hr_data/blob/master/script.sql

-- Найдите и исправьте ошибку в SQL-запросе, который должен вывести имена и фамилии сотрудников, 
-- чья зарплата выше средней зарплаты всех сотрудников.
select first_name, last_name
from employees
where salary > avg(salary);


select first_name, last_name
from employees
where salary > (select avg(salary) from employees);

-- Найдите и исправьте ошибку в SQL-запросе, который должен вывести имена и фамилии сотрудников 
-- из таблицы employees, чья зарплата выше средней зарплаты всех сотрудников отдела с названием 'Shipping'.
select t1.first_name, t1.last_name
from employees t1
join departments t2
where t1.salary > (select avg(salary) from employees join departments where department_name = 'Shipping');


select t1.first_name, t1.last_name
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t1.salary > (select avg(salary) 
					from employees t1
                    join departments t2
                    on t1.department_id = t2.department_id
                    where department_name = 'Shipping');

-- 1. Найти сотрудников, которые зарабатывают больше максимальной зарплаты сорудников департамента Shipping.
-- Вывести имена и фамилии сотрудников, а также название департаментов.

select t1.first_name, t1.last_name, t2.department_name
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t1.salary > (select max(t1.salary)
				from employees t1
                join departments t2
                on t1.department_id = t2.department_id
                where t2.department_name = 'Shipping');


-- 2. Вывести имя и фамилию сотрудника с минимальной зарплатой, который работает в городе Seattle.

select min(t1.salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
where t3.city = 'Seattle';

select t1.first_name, t1.last_name
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
where t3.city = 'Seattle' and t1.salary = (select min(t1.salary)
				from employees t1
				join departments t2
				on t1.department_id = t2.department_id
				join locations t3
				on t2.location_id = t3.location_id
				where t3.city = 'Seattle');

-- 3. Найти количество сотрудников из департамента Shipping, 
-- которые зарабатывают меньше средней зарплаты среди всех сотрудников этого департамента.

select avg(t1.salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Shipping';

select count(*)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Shipping' and t1.salary < (select avg(t1.salary)
														from employees t1
														join departments t2
														on t1.department_id = t2.department_id
														where t2.department_name = 'Shipping');


-- 4. Найти сотрудников, работающих в стране 'United States of America', 
-- чья зарплата выше средней зарплаты сотрудников, работающих в стране 'United Kingdom'. 
-- Вывести их имена, фамилии и зарплаты.

select avg(t1.salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
join countries t4
on t3.country_id = t4.country_id
where t4.country_name = 'United Kingdom';

select first_name, last_name, salary
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
join countries t4
on t3.country_id = t4.country_id
where t4.country_name = 'United States of America' and t1.salary > (select avg(t1.salary)
																	from employees t1
																	join departments t2
																	on t1.department_id = t2.department_id
																	join locations t3
																	on t2.location_id = t3.location_id
																	join countries t4
																	on t3.country_id = t4.country_id
																	where t4.country_name = 'United Kingdom');

-- Д/З
-- 5. Найти среднюю зарплату среди сотрудников, работающих в стране 'United Kingdom'.
-- 6. Вывести имена и фамилии сотрудников с должностями IT_PROG и ST_MAN, которые получают либо самую низкую, либо самую высокую зарплату.
-- 7. Вывести список городов, в которых есть сотрудники с зарплатой ниже средней зарплаты сотрудников в городе Оксфорд.

