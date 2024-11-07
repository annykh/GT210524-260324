-- Д/З
-- 5. Найти среднюю зарплату среди сотрудников, работающих в стране 'United Kingdom'.
select avg(salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
join countries t4
on t3.country_id = t4.country_id
where t4.country_name = 'United Kingdom';

-- 6. Вывести имена и фамилии сотрудников с должностями IT_PROG и ST_MAN, которые получают либо самую низкую, 
-- либо самую высокую зарплату.
select max(salary)
from employees
where job_id in ('IT_PROG', 'ST_MAN');

select min(salary)
from employees
where job_id in ('IT_PROG', 'ST_MAN');

select first_name, last_name, job_id, salary
from employees
where job_id in ('IT_PROG', 'ST_MAN') and (salary = (select max(salary)
													from employees
													where job_id in ('IT_PROG', 'ST_MAN'))
										or salary = (select min(salary)
													from employees
													where job_id in ('IT_PROG', 'ST_MAN')));

-- 7. Вывести список городов, в которых есть сотрудники с зарплатой ниже средней зарплаты сотрудников в городе Оксфорд.

select avg(salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
join locations t3
on t2.location_id = t3.location_id
where t3.city = 'Oxford';

select distinct city
from locations t1
join departments t2
on t1.location_id = t2.location_id
join employees t3
on t2.department_id = t3.department_id
where t3.salary < (select avg(salary)
					from employees t1
					join departments t2
					on t1.department_id = t2.department_id
					join locations t3
					on t2.location_id = t3.location_id
					where t3.city = 'Oxford');
                    

-- Группировка

-- group by название_столбца
-- having условие_фильтрации         

-- select столбцы 
-- from таблица 
-- [where условие_фильтрации]
-- [joins ...]
-- [group by название_столбца]
-- [having условие_фильтрации]
-- [order by/limit ...];

-- Посчитать кол/во сотрудников в каждом департаменте. Вывести ид департамента и кол/во сотрудников.
select department_id, count(employee_id) as emp_count
from employees
group by department_id;

-- Вывести кол/во сотрудников из департаментов 10, 20, 40, 100 по отдельности.
select department_id, count(employee_id) as emp_count
from employees
where department_id in (10, 20, 40, 100)
group by department_id;

-- Вывести кол/во сотрудников в каждом департаменте, если кол/во больше 10.
select department_id, count(employee_id) as emp_count
from employees
where emp_count > 10
group by department_id;
-- Error Code: 1054. Unknown column 'emp_count' in 'where clause'	0.000 sec

select department_id, count(employee_id) as emp_count
from employees
group by department_id
having emp_count > 10;

-- Из департаментов 10, 30, 50 и 100 вывести те, в которых кол/во сотрудников больше 5.
select department_id, count(employee_id) as emp_count
from employees
where department_id in (10, 30, 50, 100)
group by department_id
having emp_count > 5;

-- Вывести максимальные зарплаты каждого департамента
-- department_id, max_salary
select department_id, max(salary) as max_salary
from employees
group by department_id;

-- Найти среднее зарплат по департаментам.
-- Вывести department_name,avg_salary
select t2.department_name, avg(t1.salary) as avg_salary
from employees t1
join departments t2
on t1.department_id = t2.department_id
group by t2.department_name;

-- Вывести те депатраменты, в которых максимальная зарплата выше 10000
-- Вывести имя департмента и зарплату.
select t2.department_name, max(t1.salary) as max_salary
from employees t1
join departments t2
on t1.department_id = t2.department_id
group by t2.department_name
having max_salary > 10000;

-- Посчитать кол/во городов в каждой стране из таблицы locations. 
-- Вывести только те страны(country_id), где кол/во городов больше 3.
select country_id, count(city) as city_count
from locations
group by country_id
having city_count > 3;


-- ПОДЗАПРОСЫ 
-- select column1, column2, ...
-- from table1
-- join (SUBSELECT)
-- on ...

-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Найти имена и фамилии сотрудников с максмальной зарплатой в каждом департаменте
select department_id, max(salary) as max_salary, first_name, last_name
from employees
group by department_id;

select t1.first_name, t1.last_name, t1.salary, t1.department_id
from employees t1
join (select department_id, max(salary) as max_salary
		from employees
		group by department_id) t2
on t1.department_id = t2.department_id
where t1.salary = t2.max_salary;

-- Найти сотрудников с минимальной зарплатой каждой должности. Вывести first_name, last_name, salary, job_id
select min(salary) as min_salary, job_id
from employees
group by job_id;

select t1.first_name, t1.last_name, t1.salary, t1.job_id
from employees t1
join (select min(salary) as min_salary, job_id
		from employees
		group by job_id) t2
on t1.job_id = t2.job_id
where t1.salary = t2.min_salary;

-- Найти департамент с наибольшим кол/вом сотрудников.
select department_id, count(employee_id) as emp_count
from employees
group by department_id
order by emp_count desc
limit 1;

-- 1. Найти кол/во сотрудников в каждом депатраменте.
select department_id, count(employee_id) as emp_count
from employees
group by department_id;

-- 2. Найти максимальное кол/во сотр. среди департаментов.
select max(t1.emp_count)
from (select department_id, count(employee_id) as emp_count
		from employees
		group by department_id) t1;
        
-- 3. Вывести ид департамента с макс. кол/вом сотрудников.
select department_id, count(employee_id) as emp_count
from employees 
group by department_id
having emp_count = (select max(t1.emp_count)
					from (select department_id, count(employee_id) as emp_count
							from employees
							group by department_id) t1);


-- Найти департаменты с наименьшим кол/вом сотрудников.

-- Вывести первый департамент с наименьшим кол/вом сотрудников.
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id
order by emp_count
limit 1;

-- Вывести департаменты и кол/во сотрудников
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id;

-- Вывести минимальное кол/во сотрудников
select min(t1.emp_count) 
from (select department_id, count(employee_id) as emp_count
		from employees
		where department_id is not null
		group by department_id) t1;
        
-- Вывести департаменты с наименьшим кол/вом сотрудников. 
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id
having emp_count = (select min(t1.emp_count) 
					from (select department_id, count(employee_id) as emp_count
							from employees
							where department_id is not null
							group by department_id) t1);
                            
                            
--  Вывести имена тех регионов, где кол/во стран больше 5.
select t1.region_name, count(t2.country_name) as country_count
from regions t1
join countries t2
on t1.region_id = t2.region_id
group by t1.region_name
having country_count > 5;

select region_name
from regions t1
join (select region_id, count(country_name) as country_count
		from countries
		group by region_id
		having country_count > 5) t2
on t1.region_id = t2.region_id;
