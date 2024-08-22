-- Работа в песочнице
-- https://www.programiz.com/sql/online-compiler/

-- Выборка
-- select *(все поля)/поле1, поле2, ...
-- from имя таблицы;

-- Вывести таблицу Customers
-- select * 
-- from Customers;

-- SELECT * FROM Customers;

-- SELECT * 
-- FROM Customers;

-- comment

/* 
comment
...
*/

-- Вывести поля first_name и last_name из Customers
-- select first_name, last_name
-- from Customers;

-- Вывести имена, фамилии и возраст покупателей из таблицы Customers, которым больше 25.
-- select first_name, last_name, age 
-- from Customers 
-- where age > 25;

-- Вывести покупателей в возрасте от 25 до 30(вкл. концы).
-- select *
-- from Customers
-- where age >= 25 and age <= 30;

-- between min and max (вкл. min и max)
-- select *
-- from Customers
-- where age between 25 and 30;

-- Вывести покупателей, которым больше 30 или меньше 25.
-- select *
-- from Customers
-- where age > 30 or age < 25;

-- select *
-- from Customers
-- where age not between 25 and 30;

-- Вывести покупателей из USA или UK.
-- select *
-- from Customers
-- where country = "USA" or country = 'UK';

-- select *
-- from Customers
-- where country in ('USA', 'UK');

-- Вывести всех покупателей кроме John, David, Alex.
-- select *
-- from Customers
-- where first_name != 'John' and first_name != 'David' and first_name != 'Alex';

-- select *
-- from Customers
-- where first_name not in ('John', 'David', 'Alex');

-- like % _
-- column like 'a%' -- начинается на букву А
-- column like '%.com' -- заканчивается на '.com'
-- column like '%country%' -- содержит подсторку country
-- column like 'usa' -- равно 'usa' не регистрозависимый
-- column like '%a_' -- предпоследняя буква 'a'
-- column like '__b%' -- третий символ b
-- column like '____' -- состоит из 4 символов

-- Вывести покупателей у которых фамилия начинается на D.
-- select *
-- from Customers
-- where last_name like 'd%';

-- Вывести покупателей у которых фамилия начинается на F.
-- select *
-- from Customers
-- where last_name like 'f%';
-- Выборка может быть пустой 

-- Вывести покупателей у которых фамилия не заканчивается на букву E.
-- select * 
-- from customers 
-- where last_name not like '%e'; 

-- Вывести покупателей где вторая буква имени О.
-- select * 
-- from Customers
-- where first_name like '_o%';

-- Вывести покупателей где в середине имени есть буква B.
-- select *
-- from Customers
-- where first_name like '_%b%_';

-- b -
-- Ben -
-- Rob -
-- Barbarra +
-- Robert +

-- Найти ссылки по шаблону '[любые символы]www.[любые символы]sql[любые символы].com'
-- column like '%www.%sql%.com'

-- https://www.onlinesqleditor.com
-- https://www.sqleditor.com
-- https://www.onlinesql.com

-- Вывести все данные из Orders
-- select *
-- from Orders;

-- Вывести поля item, amount из Orders
-- select item, amount
-- from Orders;

-- Вывести те значения из Orders, где amount больше 1000.
-- select *
-- from Orders
-- where amount > 1000;

-- Вывести те значения из Orders, где amount в диапазоне 500 - 2000.
-- select *
-- from Orders
-- where amount between 500 and 2000;

-- select *
-- from Orders
-- where amount >= 500 and amount <= 2000;


-- Вывести поля item, amount, если amount меньше 1000 и item со значением 'Keyboard'.
-- select *
-- from Orders
-- where amount < 1000 and item = 'Keyboard';

-- Вывести те записи из Orders, где item начинается на букву M
-- select *
-- from Orders
-- where item like 'm%';

-- Вывести amount тех записей, где item 'Keyboard' или 'Mouse'
select amount
from Orders
where item = 'Keyboard' or item = 'Mouse';

select amount
from Orders
where item in ('Keyboard', 'Mouse');
