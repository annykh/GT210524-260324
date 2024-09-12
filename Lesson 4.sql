-- select *(все поля)/столбцы... 
-- from таблица
-- where условие

-- between
-- in
-- like
-- > < >= <= = !=
-- and or not

use hr;

-- Найти сотрудников, у которых имена начинаются на букву А.
select * from employees
where first_name like 'A%';

-- Вывести сотруднков у которых мейл заканчивается на .org
select * from employees
where email like '%.org';

-- Вывести сотр. у которых имя состиот из 5 букв
select * from employees
where first_name like '_____';

-- CRUD
-- Create - create database, create table
-- Read - select.. from
-- Update - alter table, update 
-- Delete - drop database, drop table, delete .. from, truncate

-- Создание бд
create database test3;

use test3;

create table new_table(
	id int,
    title varchar(128),
    price int
);

-- Простые типы данных 

-- int/integer - целое число
-- numeric/decimal(N, M) - числовые данные. N - макс. кол/во цифр(до точки и после точки), M - кол/во цифр после точки
-- varchar(макс. кол/во символов) 
-- char(фискированное кол/во символов)

-- Пример
-- varchar(10) - строка может содержать максимум 10 символов(1-10)
-- char(10) - стока может содержать ровно 10 символов

-- Ограничение таблиц (атрибуты)

-- unique - Уникальные значния
-- not null - Значение не может быть пустым  
-- default - Значение по умолчанию 
-- check(условие) - Значенние по условию 
-- primary key = unqiue + not null (в одной таблице можно использовать только одии раз)

-- auto_increment - автозаполнение 

-- Создать таблицу students1
-- id integer уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject varchar not null
-- mark integer от 0 до 5 (вкл)
-- school_no integer по умолч. 0

create database learn;
use learn;

create table students1(
	id int primary key auto_increment,
    firstname varchar(64) not null,
    lastname varchar(64) not null,
    class int check(class between 1 and 10),
    subject varchar(64) not null,
    mark int check(mark between 0 and 5),
    school_no int default 0
);

select * from students1;

-- Пример 1 с ошибкой
insert into students1
values ('John', 'Smith', 5, 'Math', 4, 106);
-- Error Code: 1136. Column count doesn't match value count
-- Ошибка: кол/во полей не совподает с кол/вом значений

-- Без ошибки 
insert into students1(firstname, lastname, class, subject, mark, school_no)
values ('John', 'Smith', 5, 'Math', 4, 106);

-- Пример 2 с ошибкой 
insert into students1(firstname, lastname, class, subject, mark, school_no)
values ('Bob', 'Brown', 11, 'Math', 5, 14);

-- Error Code: 3819. Check constraint 'students1_chk_1' is violated.
-- Проверить ограничение check_1(ограничение на поле class)

-- Без ошибки 
insert into students1(firstname, lastname, class, subject, mark, school_no)
values ('Bob', 'Brown', 10, 'Math', 5, 14);

-- Пример 3 с ошибкой 
insert into students1(firstname, class, subject, mark, school_no)
values ('Derek', 5, 'Math', 3, 105);

-- Error Code: 1364. Field 'lastname' doesn't have a default value	
-- lastname не имеет значения по умолчанию(не может быть пустым)

-- Без ошибки 
insert into students1(firstname, lastname, class, subject, mark, school_no)
values ('Derek', 'Smith', 5, 'Math', 3, 105);

-- Пример 4 на ограничение default
insert into students1(firstname, lastname, class, subject, mark)
values ('Ben', 'Jameson', 3, 'Math', 4);

select * from students1;

-- В бд learn создать таблицу products1
-- id целое число уникальное и не пустое, автозаполнение
-- title строка не пустое значение
-- price целое число по умолч. 0
-- count целое число от 1 до 100

create table products1(
	id int primary key auto_increment,
    title varchar(64) not null,
    price int default 0,
    count int check(count between 1 and 100)
);

-- Добавить новое поле in_stock, тип строка фиксировано один символ, по умолчанию 'N'
-- Удалить поле count
-- Изменить тип price на numeric(7, 2)

alter table products1
add in_stock char(1) default 'N',
drop count,
modify price numeric(7, 2);

insert into products1(title, price, in_stock)
values ('iPhone 15', 1000, 'Y');

insert into products1(title, price, in_stock)
values ('iPhone 15 pro', 1100, 'Y');

insert into products1(title, price, in_stock)
values ('iPhone 15 pro max', 1200, 'N');

insert into products1(title, price, in_stock)
values ('iPhone 14', 800, 'Y');

insert into products1(title, price, in_stock)
values ('iPhone 14 pro', 900, 'N');

insert into products1(title, price, in_stock)
values ('iPhone 14 pro max', 950, 'Y');

select * from products1;

-- Изменить цену iPhone 14 pro max на 1000
update products1
set price = 1000
where title = 'iPhone 14 pro max';
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec

set sql_safe_updates = 0;

update products1
set price = 1000
where title = 'iPhone 14 pro max';

-- Повысить price на 100 для всех товаров
update products1
set price = price + 100;

-- set sql_safe_updates = 1;

-- Удалить все товары, которых нет в наличии.
delete from products1
where in_stock = 'N';

delete from products1;

select * from products1;

insert into products1(title, price, in_stock)
values ('iPhone 15', 1000, 'N'); 

truncate table products1; 

insert into products1(title, price, in_stock)
values ('iPhone 15', 1000, 'N'); 


-- 1.  Создать таблицу customers
-- id целое число первичный ключ автоинкремент, 
-- first_name строка не null,
-- last_name строка не null,
-- age целое число больше 18,
-- phone integer не null,
-- order_name строка не null,
-- delivery_status целое число 1 или 0

create table customers(
	id int primary key auto_increment,
    first_name varchar(64) not null,
    last_name varchar(64) not null,
    age int check(age>18),
    phone int not null,
    order_name varchar(64) not null,
    delivery_status int check(delivery_status in (1, 0))
);

-- 2. Удалить поля first_name и last_name 
-- 3. Добавить поле full_name строка не null, вставить после id

-- add ... after id -- после id
-- add ... before age -- до age
-- add ... first -- в начало

alter table customers
drop first_name,
drop last_name,
add full_name varchar(128) not null after id;
