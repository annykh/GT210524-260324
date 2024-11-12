-- https://github.com/annykh/genTech/blob/main/CompanyDB.txt
drop database companydb;

CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Budget DECIMAL(10, 2)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked DECIMAL(5, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary, DepartmentID, HireDate) VALUES
(1, 'John', 'Doe', 6000, 1, '2021-01-15'),
(2, 'Jane', 'Smith', 7500, 1, '2019-11-23'),
(3, 'Jim', 'Brown', 8000, 2, '2020-03-12'),
(4, 'Jake', 'Williams', 5500, 2, '2022-07-01'),
(5, 'Jess', 'Taylor', 7000, 3, '2018-05-08'),
(6, 'Jill', 'Adams', 6700, 3, '2021-06-22'),
(7, 'James', 'Davis', 9000, 4, '2020-09-30'),
(8, 'Jenny', 'Wilson', 6500, 4, '2019-04-18'),
(9, 'Jerry', 'Moore', 7200, 5, '2018-08-25');

INSERT INTO Projects (ProjectID, ProjectName, Budget) VALUES
(1, 'Website Redesign', 15000),
(2, 'New HR Software', 20000),
(3, 'Financial Audit', 10000),
(4, 'Sales Campaign', 25000),
(5, 'Market Research', 18000);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(1, 1, 120),
(2, 1, 80),
(3, 2, 100),
(4, 2, 60),
(5, 3, 110),
(6, 3, 90),
(7, 4, 150),
(8, 4, 110),
(9, 5, 130);

-- 1. Найдите среднюю зарплату сотрудников в каждом департаменте. Выведите название департамента и среднюю зарплату.

-- первый вариант
select t2.DepartmentName, avg(t1.salary) as avg_salary
from employees t1
join departments t2
on t1.DepartmentID = t2.DepartmentID
group by t2.DepartmentName;

-- второй вариант
select t1.DepartmentName, t2.avg_salary
from departments t1
join (select DepartmentID, avg(salary) as avg_salary
		from employees
		group by DepartmentID) t2
on t1.DepartmentID =t2.DepartmentID;


-- 2. Определите количество сотрудников в каждом департаменте. Выведите название департамента и количество сотрудников.
select t1.DepartmentName, count(t2.employeeid) as emp_count
from departments t1
join employees t2
on t1.DepartmentID = t2.DepartmentID
group by t1.DepartmentName;

-- 3. Найдите минимальную и максимальную зарплаты в каждом департаменте. 
-- Выведите название департамента, минимальную и максимальную зарплату.
select t1.DepartmentName, min(t2.salary) as min_salary, max(t2.salary) as max_salary
from departments t1
join employees t2
on t1.DepartmentID = t2.DepartmentID
group by t1.DepartmentName;

-- 4. Определите общую сумму зарплат в каждом департаменте. Выведите название департамента и общую сумму зарплат.
select t1.DepartmentName, sum(t2.salary) as total_salary
from departments t1
join employees t2
on t1.DepartmentID = t2.DepartmentID
group by t1.DepartmentName;

-- 5. Вывести ID департамента с самой высокой средней зарплатой сотрудников.
select departmentid, avg(salary) as avg_salary
from employees
group by departmentid;

select max(t1.avg_salary)
from (select departmentid, avg(salary) as avg_salary
		from employees
		group by departmentid) t1;
        
select departmentid, avg(salary) as avg_salary
from employees
group by departmentid
having avg_salary = (select max(t1.avg_salary)
					from (select departmentid, avg(salary) as avg_salary
							from employees
							group by departmentid) t1);


-- 6. Вывести имя департамента с самой высокой средней зарплатой сотрудников.
select t1.departmentname
from departments t1
join (select departmentid, avg(salary) as avg_salary
		from employees
		group by departmentid
		having avg_salary = (select max(t1.avg_salary)
							from (select departmentid, avg(salary) as avg_salary
									from employees
									group by departmentid) t1)) t2
on t1.departmentid = t2.departmentid;

-- 7. Выведите имя, фамилию и зарплату сотрудников, чья зарплата выше средней по их департаменту.
select departmentid, avg(salary) as avg_salary
from employees
group by departmentid;

select t1.firstname, t1.lastname, t1.salary
from employees t1
join (select departmentid, avg(salary) as avg_salary
		from employees
		group by departmentid) t2
on t1.departmentid = t2.departmentid
where t1.salary > t2.avg_salary;

-- Доп. задачи.
-- 8. Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.
-- 9. Найдите департамент с наименьшим количеством сотрудников. Выведите название департамента и количество сотрудников.
-- 10. Определите департамент с наибольшим суммарным бюджетом проектов, на которых работают его сотрудники.
-- 10.1. Вывести ид департамента, имена и фамилии сотрудников, имена проектов и их бюджет.
-- 10.2. Вывести ид депатамента и сумма бюджета проектов по департаментам.
-- 10.3. Вывести маскимальную сумму бюджета проектов по департаментам.
-- 10.4. Вывести ид депатамента с максимальной суммой бюджета проектов по департаментам.
-- 10.5. Вывести имя депатамента с максимальной суммой бюджета проектов по департаментам.
-- 11. Найдите сотрудников, которые работают в департаменте с самой большой суммарной зарплатой среди всех департаментов.
