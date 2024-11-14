-- 8. Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.
-- 8.1. Вывести ид проекта и кол/во сотрудников, которые поработали больше 100 часов.
select ProjectID, count(employeeid) as emp_count
from employeeprojects
where HoursWorked > 100
group by ProjectID;

-- 8.2 Вывести максимальное кол/во сотрудников, ...
select max(t1.emp_count) as max_emp_count
from (select ProjectID, count(employeeid) as emp_count
		from employeeprojects
		where HoursWorked > 100
		group by ProjectID) t1;

-- 8.3 Вывести ид проекта с максимальным кол/во сотрудников, ...
select projectid, count(EmployeeID)
from employeeprojects 
where HoursWorked > 100
group by ProjectID
having count(EmployeeID) = (select max(t1.emp_count) as max_emp_count
							from (select ProjectID, count(employeeid) as emp_count
									from employeeprojects
									where HoursWorked > 100
									group by ProjectID) t1);
                                    
-- 8.4 Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.
select projectName
from projects t1
join (select projectid, count(EmployeeID)
		from employeeprojects 
		where HoursWorked > 100
		group by ProjectID
		having count(EmployeeID) = (select max(t1.emp_count) as max_emp_count
									from (select ProjectID, count(employeeid) as emp_count
											from employeeprojects
											where HoursWorked > 100
											group by ProjectID) t1)) t2
on t1.projectid = t2.projectid;
                                    
-- 9. Найдите департамент с наименьшим количеством сотрудников. Выведите название департамента и количество сотрудников.
select t1.departmentName, t2.emp_count
from departments t1
join (select DepartmentID, count(EmployeeID) as emp_count
		from employees
		group by DepartmentID
		having emp_count = (select min(t1.emp_count) as min_emp_count
							from (select DepartmentID, count(employeeid) as emp_count
									from employees
									group by DepartmentID) t1)) t2
on t1.departmentid = t2.departmentid;


-- 10. Определите департамент с наибольшим суммарным бюджетом проектов, на которых работают его сотрудники.
-- 10.1. Вывести ид департамента, имена и фамилии сотрудников, имена проектов и их бюджет.
select t1.departmentid, t1.firstname, t1.lastname, t3.projectname, t3.budget
from employees t1
join employeeprojects t2
on t1.EmployeeID = t2.EmployeeID
join projects t3
on t2.ProjectID = t3.ProjectID;

-- 10.2. Вывести ид депатамента и сумма бюджета проектов по департаментам.
select t1.departmentid, sum(t3.Budget) as budget_sum
from employees t1
join employeeprojects t2
on t1.EmployeeID = t2.EmployeeID
join projects t3
on t2.ProjectID = t3.ProjectID
group by DepartmentID;

-- 10.3. Вывести маскимальную сумму бюджета проектов по департаментам.
select max(t1.budget_sum) as max_budget_sum
from (select t1.departmentid, sum(t3.Budget) as budget_sum
		from employees t1
		join employeeprojects t2
		on t1.EmployeeID = t2.EmployeeID
		join projects t3
		on t2.ProjectID = t3.ProjectID
		group by DepartmentID) t1;

-- 10.4. Вывести ид депатамента с максимальной суммой бюджета проектов по департаментам.
select t1.departmentid, sum(t3.Budget) as budget_sum
from employees t1
join employeeprojects t2
on t1.EmployeeID = t2.EmployeeID
join projects t3
on t2.ProjectID = t3.ProjectID
group by DepartmentID
having budget_sum = (select max(t1.budget_sum) as max_budget_sum
					from (select t1.departmentid, sum(t3.Budget) as budget_sum
							from employees t1
							join employeeprojects t2
							on t1.EmployeeID = t2.EmployeeID
							join projects t3
							on t2.ProjectID = t3.ProjectID
							group by DepartmentID) t1);

-- 10.5. Вывести имя депатамента с максимальной суммой бюджета проектов по департаментам.
select t1.departmentname
from departments t1
join (select t1.departmentid, sum(t3.Budget) as budget_sum
		from employees t1
		join employeeprojects t2
		on t1.EmployeeID = t2.EmployeeID
		join projects t3
		on t2.ProjectID = t3.ProjectID
		group by DepartmentID
		having budget_sum = (select max(t1.budget_sum) as max_budget_sum
							from (select t1.departmentid, sum(t3.Budget) as budget_sum
									from employees t1
									join employeeprojects t2
									on t1.EmployeeID = t2.EmployeeID
									join projects t3
									on t2.ProjectID = t3.ProjectID
									group by DepartmentID) t1)) t2
on t1.departmentid = t2.departmentid;

-- 11. Найдите сотрудников, которые работают в департаменте с самой большой суммарной зарплатой среди всех департаментов.
select t1.firstname, t1.lastname
from employees t1
join (select departmentid, sum(salary) as total_salary
		from employees 
		group by departmentid
		having total_salary = (select max(t1.total_salary) as max_total_salary
								from (select departmentid, sum(salary) as total_salary
										from employees 
										group by departmentid) t1)) t2
on t1.departmentid = t2.departmentid;
