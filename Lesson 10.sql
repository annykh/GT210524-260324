-- Встроенные функции

-- concat()
-- concat_ws()
-- length()
-- ltrim()
-- rtrim()
-- trim()
-- locate()
-- left()
-- right()
-- substring()
-- replace()
-- insert()
-- lpad()
-- rpad()
-- upper()
-- lower()
-- reverse()
-- repeat()

select * from employees;

-- Создать новое поле full_name и заполнить по маске: 'first_name last_name'
alter table employees
add full_name varchar(128);

set sql_safe_updates = 0;

update employees
set full_name = concat(first_name, ' ', last_name);

-- Создать новое поле tel_code тип char(3) и заполнить первыми тремя символами поля phone_NUMERIC.
alter table employees
add tel_code char(3);

update employees
set tel_code = left(phone_NUMERIC, 3);

-- Оператор CASE (if - else if - else)

-- CASE
-- 	   When условие1 then результат1
--     When условие2 then результат2
--     When условие3 then результат3
--     ...
--     Else альтернативный результат
-- END

-- Создать поле tel_info varchar(60) и заполнить:
-- Если tel_code = 515, то 'Admin',
-- Если tel_code = 590, то 'Prog',
-- Если tel_code = 650, то 'Stock',
-- Если tel_code = 011, то 'Sales',
-- В остальных случаях 'Undefined'

alter table employees
add tel_info varchar(60);

update employees
set tel_info = case
					when tel_code = '515' then 'Admin'
                    when tel_code = '590' then 'Prog'
					when tel_code = '650' then 'Stock'
					when tel_code = '011' then 'Sales'
                    else 'Undefined'
				end;
                
-- Добавьте новое поле new_email в таблицу employees и 
-- заполните его значениями из существующего поля email по шаблону: 
-- первая буква в верхнем регистре, 
-- а остальные буквы в нижнем (Sking, Nkochhar, ...)

-- lower
-- upper
-- left
-- right + lenght - 1
-- substring
-- concat

-- concat('S', 'king')

alter table employees
add new_email varchar(60);

-- Вывод первого символа в верхнем регистре
select upper(left(email, 1))
from employees;

-- Вывод остальных символов в нижнем регистре
select lower(right(email, length(email) - 1))
from employees;

select lower(substring(email, 2))
from employees;

-- Вывод мейла по шаблону  
select concat(upper(left(email, 1)), lower(substring(email, 2)))
from employees;

update employees
set new_email = concat(upper(left(email, 1)), lower(substring(email, 2)));

select * from employees;


-- Д/з
-- create table products2(
-- 	id int primary key auto_increment, 
--     title varchar(128),
--     price int,
--     description varchar(255)
-- );

-- insert into products2 (title, price, description)
-- values ('notebook', 400, 'Lorm ipsum dolor sit amet, consectetur adipiscing elit. Nunc at tortor eu risus imperdiet lacinia at nec felis. Etiam imperdiet ante purus, at tristique neque malesuada eu. Nullam sed sodales lacus.'),
-- 		('pen', 10, 'Lorm ipsum dolor sit amet, consectetur adipiscing elit. Nunc at tortor eu risus imperdiet lacinia at nec felis. Etiam imperdiet ante purus, at tristique neque malesuada eu. Nullam sed sodales lacus. '),
--         ('pencil', 15, 'Lorm ipsum dolor sit amet, consectetur adipiscing elit. Nunc at tortor eu risus imperdiet lacinia at nec felis. Etiam imperdiet ante purus, at tristique neque malesuada eu. Nullam sed sodales lacus. ');
--         

-- Замнить слово Lorm на Lorem в поле description
-- В поле description до слово 'Etiam' заменить все буквы 'o' на '0'.


-- Функции для работы с числами
-- int/integer, numeric/decimal 

-- round: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление
select round(123.34); -- 123
select round(123.6); -- 124
select round(123.45678, 2); -- 123.46

select round(123.23, -1); -- 120
select round(123.23, -2); -- 100
select round(123.23, -3); -- 0

-- CEILING: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(123.23); -- 124

-- FLOOR: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(123.67); -- 123

-- ABS: возвращает абсолютное значение числа.
select abs(-123); -- 123

-- POWER: возводит число в определенную степень.
select power(5, 3); -- 5^3 = 125

-- SQRT: получает квадратный корень числа.
select sqrt(225); -- 15 

-- SIGN: возвращает -1, если число меньше 0, и возвращает 1, если число больше 0. Если число равно 0, то возвращает 0.
select sign(-10); -- -1
select sign(10); -- 1
select sign(0); -- 0

-- RAND: генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select rand();

-- 0 - 10
select round((rand() * 10));

-- drop database shop;
-- CREATE DATABASE shop;

-- USE shop;

-- CREATE TABLE SELLERS(
--        SELL_ID    INTEGER, 
--        SNAME   VARCHAR(20), 
--        CITY    VARCHAR(20), 
--        COMM    NUMERIC(2, 2),
--              BOSS_ID  INTEGER
-- );
--                                             
-- CREATE TABLE CUSTOMERS(
--        CUST_ID    INTEGER, 
--        CNAME   VARCHAR(20), 
--        CITY    VARCHAR(20), 
--        RATING  INTEGER
-- );

-- CREATE TABLE ORDERS(
--        ORDER_ID  INTEGER, 
--        AMT     NUMERIC(7,2), 
--        ODATE   DATE, 
--        CUST_ID    INTEGER,
--        SELL_ID    INTEGER 
-- );

-- INSERT INTO SELLERS VALUES(201,'Oleg','Moskva',0.12,202);
-- INSERT INTO SELLERS VALUES(202,'Lev','Sochi',0.13,204);
-- INSERT INTO SELLERS VALUES(203,'Arsenij','Vladimir',0.10,204);
-- INSERT INTO SELLERS VALUES(204,'Ekaterina','Moskva',0.11,205);
-- INSERT INTO SELLERS VALUES(205,'Leonid ','Kazan',0.15,NULL);


-- INSERT INTO CUSTOMERS VALUES(301,'Andrej','Moskva',100);
-- INSERT INTO CUSTOMERS VALUES(302,'Mihail','Tula',200);
-- INSERT INTO CUSTOMERS VALUES(303,'Ivan','Sochi',200);
-- INSERT INTO CUSTOMERS VALUES(304,'Dmitrij','Yaroslavl',300);
-- INSERT INTO CUSTOMERS VALUES(305,'Ruslan','Moskva',100);
-- INSERT INTO CUSTOMERS VALUES(306,'Artyom','Tula',100);
-- INSERT INTO CUSTOMERS VALUES(307,'Yuliya','Sochi',300);


-- INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
-- INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
-- INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
-- INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
-- INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
-- INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
-- INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
-- INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
-- INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
-- INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);

-- use shop;

-- Работа с датами

-- Типы данных для работы с датой и временем

-- date - yyyy-mm-dd - 1 январа 1000 года до 31 декабря 9999 - 1000-01-01 до 9999-12-31 (3 байт)
-- time - hh:mm:ss (3 байт)
-- datetime - yyyy-mm-dd hh:mm:ss (8 байт) - 1000-01-01 до 9999-12-31
-- timestamp - yyyy-mm-dd hh:mm:ss (4 байт) - 1970-01-10 00:00:01 до 2038-01-19 03:14:07
-- year - yyyy (1 байт)


-- Функции для работы с датой и временем

select now(); -- текущую дату и время datetime
select sysdate(); -- текущую дату и время datetime
select current_timestamp(); -- текущую дату и время datetime

select curdate(); -- текущую дату
select current_date(); -- текущую дату

select curtime(); -- текущее время
select current_time(); -- текущее время

-- dayofmonth(date) - день месяца(число)
select dayofmonth('2024-05-25'); -- 25

select dayofmonth(odate)
from orders;

-- dayofweek(date) - день недели(число)
select dayofweek('2024-05-25');

-- dayofyear(date) - номер дня в году (число)
select dayofyear('2024-05-25');

-- month(date) - номер месяца в году (число)
select month('2024-05-25');

-- Вывести все заказы за март 
select *
from orders
where month(odate) = 3;

-- year(date) - год даты(число)
select year('2024-05-25');

-- week(date, [first]) - номер недели. first - если равен 1, то первым днем будет понедельник, иначе воскресенье 
select week('2024-05-25'); -- 20
select week('2024-05-25', 1); -- 21

-- dayname - название дня недели(varchar)
select dayname('2024-05-25');

-- monthname - название месяца (varchar)
select monthname('2024-05-25');

-- Вывести все заказы за март 
select *
from orders
where monthname(odate) = 'March';

-- hour(time) - час
select hour('12:34:56');

-- minute(time) - минуты
select minute('12:34:56');

-- second(time) - секунды
select second('12:34:56');

-- Функция EXTRACT извлекает из даты и времени какой-то определенный компонент. 

-- extract(param from datetime);

-- значение param:
-- second
-- minute
-- hour
-- day
-- month
-- year
-- minute_second
-- hour_minute
-- day_hour

select extract(day from '2024-05-25 12:23:34'); -- 25
select extract(year from '2024-05-25 12:23:34'); -- 2024
select extract(minute_second from '2024-05-25 12:23:34'); -- 2334

select concat(left(extract(minute_second from '2024-05-25 12:23:34'), 2), ':', right(extract(minute_second from '2024-05-25 12:23:34'), 2));

-- Форматирование дат и времени

-- date_format(date, format)
-- time_format(time, format)

-- Значение format:

	-- %m: месяц 01-12
	-- %c: месяц 1-12
    -- %M: название месяца(January...December)
    -- %b: аббревиатура месяца (Jan..Dec)
    
    -- %d: день месяца 01..31
    -- %e: день месяца 1...31
    -- %D: номер дня месаца (1st, 2nd, 3rd...)
    
    -- %y: год в виде двух цифр yy
    -- %Y: год в виде четырех цифр yyyy
    
    -- %W: название дня недели(Sunday...Saturday)
    -- %a: аббревиатура дня недели(Sun..Sat)
    
    -- %H: час 00..23
	-- %k: час 0..23
    -- %h: час 01..12
    -- %l: час  1..12
    -- %p: AM/PM

	-- %i: минуты 00..59
    -- %S: секунды 00..59
    
    -- %r: время в 12-ти часавом формате (hh:mm:ss AM/PM)
    -- %T: время в 12-ти часавом формате (hh:mm:ss)
    
-- dd m yy    
select date_format('2024-05-25', '%d %c %y');    

-- Day - dd, Month - mm, Year - yy
select date_format('2024-05-25', 'Day - %d, Month - %m, Year - %y');

-- hh(-12)-mm-ss
select time_format('20:34:06', '%h-%i-%S');

-- https://www.w3schools.com/sql/func_mysql_str_to_date.asp
