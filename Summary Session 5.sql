-- union/union all

use tasksgt;

create table user1(
	id int primary key auto_increment,
    name varchar(64),
    age int,
    mail varchar(128)
);

create table user2(
	id int primary key auto_increment,
    f_name varchar(64),
    age int,
    salary int
);

insert into user1 (name, age, mail)
values ('John', 35, 'john345@gmail.com'),
		('Ben', 23, 'ben1234@gmail.com'),
		('Den', 25, 'den12@gmail.com');
        
insert into user2 (f_name, age, salary)
values ('Bob', 33, 5000),
		('James', 54, 2500),
		('Den', 25, 4000);        

-- bad practice
select name, age, mail
from user1
union 
select f_name, age, salary
from user2;

-- good practice
select name, age, mail, 0 as salary
from user1
union 
select f_name, age, 'none' as mail, salary
from user2;
       
       
select name, age
from user1
union all
select f_name, age
from user2;  

-- без дубликатов
select name, age
from user1
union
select f_name, age
from user2;


-- 1. Создать таблицу products1 с полями:
-- id (целое число, первичный ключ)
-- name (cтрока максимум 50 символов)
-- quantity (число больше 0 и меньше 10)
-- in_stock (один символ (Y/N))


create table products1(
	id int primary key,
    name varchar(50),
    quantity int check(quantity > 0 and quantity < 10),
    in_stock char(1) check(in_stock in ('Y', 'N'))
);

insert into products1
values (1, 'Велосипед', 2, 'Y'), 
		(2, 'Скейт', 4, 'Y'), 
		(3, 'Самокат', 2, 'Y'), 
		(4, 'Сноуборд', 7, 'N'), 
		(5, 'Санки', 1, 'Y'), 
		(6, 'Коньки', 3, 'N'), 
		(7, 'Ролики', 5, 'Y');     
        
-- Создать таблицу products2 с полями:
-- id (целое число, первичный ключ)
-- name (cтрока максимум 50 символов)
-- quantity (число больше 0 и меньше 10)
-- price (целое число, больше 0)
-- in_stock (один символ (Y/N))

create table products2(
	id int primary key,
    name varchar(50),
    quantity int check(quantity > 0 and quantity < 10),
    price int check(price > 0),
    in_stock char(1) check(in_stock in ('Y', 'N'))
);

insert into products2 
values (1, 'Тюбинг', 5, 1000, 'Y'), 
		(2, 'Санки', 2, 1500, 'Y'), 
		(3, 'Снегокат', 2, 900, 'Y'), 
		(4, 'Сноуборд', 7, 700, 'N'), 
		(5, 'Клюшка', 8, 300, 'Y'), 
		(6, 'Коньки', 3, 350, 'N'), 
		(7, 'Форма', 9, 450, 'Y');

-- Вывести все названия товаров (включая дубли) из двух таблиц.
select name from products1
union all
select name from products2;

-- Вывести уникальные названия товаров (без дублей) из двух таблиц.
select name from products1
union
select name from products2;

-- Объединить данные из двух таблиц, указав price, где это возможно, где нет - указать null.
select name, quantity, in_stock, null as price
from products1
union
select name, quantity, in_stock, price
from products2;

-- Из двух таблиц вывести те товары, где кол/во больше 5.
select name, quantity, in_stock, null as price
from products1
where quantity > 5
union
select name, quantity, in_stock, price
from products2
where quantity > 5;

select t1.name, t1.quantity, t1.in_stock, t1.price
from (select name, quantity, in_stock, null as price
		from products1
		union
		select name, quantity, in_stock, price
		from products2) as t1
where t1.quantity > 5;
