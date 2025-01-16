-- MYSQL

-- CRUD

-- Create - create database, create table
-- Read - select .. from (where, limit, order by, join, left join, right join, union/union all, group by, having)
-- Update - alter table(add, drop, change, rename, modify), update.. set
-- Delete  - drop database, drop table, delete from ...

-- Создать бд tasks20
create database tasks20;

-- Активировать бд tasks20
use tasks20;

-- Созадать таблицу users
-- 		id int pk a_i
--     name varchar
--     age int > 18
-- 	   status со знач. 0
-- 		email уникальное знач.

create table users(
		id int primary key auto_increment,
        name varchar(128),
        age int check(age > 18),
        status int default 0, 
        email varchar(128) unique
);
    
-- Заполнить таблицу 
insert into users(name, age, email)
values ('John', 20, 'john123@gmail.com');

CREATE DATABASE shop;

USE shop;

CREATE TABLE SELLERS(
       SELL_ID    INTEGER, 
       SNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       COMM    NUMERIC(2, 2),
             BOSS_ID  INTEGER
);
                                            
CREATE TABLE CUSTOMERS(
       CUST_ID    INTEGER, 
       CNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       RATING  INTEGER
);

CREATE TABLE ORDERS(
       ORDER_ID  INTEGER, 
       AMT     NUMERIC(7,2), 
       ODATE   DATE, 
       CUST_ID    INTEGER,
       SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201,'Олег','Москва',0.12,202);
INSERT INTO SELLERS VALUES(202,'Лев','Сочи',0.13,204);
INSERT INTO SELLERS VALUES(203,'Арсений','Владимир',0.10,204);
INSERT INTO SELLERS VALUES(204,'Екатерина','Москва',0.11,205);
INSERT INTO SELLERS VALUES(205,'Леонид ','Казань',0.15,NULL);


INSERT INTO CUSTOMERS VALUES(301,'Андрей','Москва',100);
INSERT INTO CUSTOMERS VALUES(302,'Михаил','Тула',200);
INSERT INTO CUSTOMERS VALUES(303,'Иван','Сочи',200);
INSERT INTO CUSTOMERS VALUES(304,'Дмитрий','Ярославль',300);
INSERT INTO CUSTOMERS VALUES(305,'Руслан','Москва',100);
INSERT INTO CUSTOMERS VALUES(306,'Артём','Тула',100);
INSERT INTO CUSTOMERS VALUES(307,'Юлия','Сочи',300);


INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);

select *
from customers;

select *
from sellers;

select * 
from orders;

-- Вывести всех клиентов из города Тула с рейтингом больше 100.
select *
from customers
where city = 'Тула' and rating > 100;

-- = != > < >= <=
-- and or
-- is null / is not null
-- between min and max
-- in (val1, val2, val3)
-- like % _

-- Вывести всех продавцов, чьи имена начинаются на букву 'Л'.
select * 
from sellers
where sname like 'Л%';

-- Вывести всех продавцов, чьи комиссии между 0.10 и 0.15 (включительно).
select *
from sellers
where comm between 0.10 and 0.15;

-- Вывести список всех продавцов из Москвы, отсортированный по убыванию их идентификаторов.
select *
from sellers
where city = 'Москва'
order by sell_id desc;

-- Вывести пары покупателей и обслуживших их продавцов из одного города.
select c.cname, s.sname
from customers c
join orders o
on c.cust_id = o.cust_id
join sellers s
on s.sell_id = o.sell_id
where c.city = s.city;

-- Вывести имена всех продавцов, которые продают товары клиентам из Тулы.
select sname
from sellers s
join orders o
on s.sell_id = o.sell_id
join customers c
on o.cust_id = c.cust_id
where c.city = 'Тула';
