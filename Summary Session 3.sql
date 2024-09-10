-- create database tasksGT;
-- use tasksGT;

-- Создать таблицу staff используя файл staff.txt
-- https://github.com/annykh/genTech/blob/main/staff.txt

-- CREATE TABLE Staff (
--     id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     firstname VARCHAR(64) NOT NULL,
--     lastname VARCHAR(64) NOT NULL,
--     position VARCHAR(128),
--     age INTEGER,
--     has_child CHAR(1),
--     username VARCHAR(128) unique
--   );

-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Daniels'
--         , 'Senior Teacher'
--         , 22
--         , 'N'
--         , 'annakhach5'
--         );
--         
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Austin'
--         , 'Junior Blogger'
--         , 25
--         , 'Y'
--         , 'tom12345'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Bill'
--         , 'Lorentz'
--         , 'Junior Web Developer'
--         , 40
--         , 'Y'
--         , 'billt1'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Lily'
--         , 'May'
--         , 'Junior Backend Developer'
--         , 25
--         , 'Y'
--         , 'lil12'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Nona'
--         , 'Lucky'
--         , 'Junior Teacher'
--         , 20
--         , 'N'
--         , 'LuckyNona'
--         ); 
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ( 'Nancy'
--         , 'Greenberg'
--         , 'Middle UI Designer'
--         , 32
--         , 'Y'
--         , 'nancy1'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Daniel'
--         , 'Faviet'
--         , 'Senior UX Designer'
--         , 43
--         , 'Y'
--         , 'favietD'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ally'
--         , 'Austin'
--         , 'Junior UI Designer'
--         , 28
--         , 'N'
--         , 'ally1'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Lily'
--         , 'Chen'
--         , 'Senior Teacher'
--         , 25
--         , 'Y'
--         , 'lilychen'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Austin'
--         , 'Middle Teacher'
--         , 34
--         , 'Y'
--         , 'anna28'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Alexander'
--         , 'Lorentz'
--         , 'Junior Backend Developer'
--         , 25
--         , 'N'
--         , 'alex12345'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Lorentz'
--         , 'Junior UX Designer'
--         , 18
--         , 'N'
--         , 'lorentz99'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Lucky'
--         , 'Middle Blogger'
--         , 34
--         , 'Y'
--         , 'lucky78'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Weiss'
--         , 'Junior Blogger'
--         , 18
--         , 'N'
--         , 'weiss11'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Weiss'
--         , 'Junior UI Designer'
--         , 18
--         , 'N'
--         , 'tom222'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Bloom'
--         , 'Middle UX Designer'
--         , 20
--         , 'N'
--         , 'bloom5'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Berg'
--         , 'Middle Teacher'
--         , 34
--         , 'N'
--         , 'tommy1'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Berg'
--         , 'Senior Teacher'
--         , 37
--         , 'N'
--         , 'ash89'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Lily'
--         , 'Weiss'
--         , 'Middle Blogger'
--         , 45
--         , 'N'
--         , 'lilyW1'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Lorentz'
--         , 'Senior UX Designer'
--         , 31
--         , 'N'
--         , 'annlo1'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Weiss'
--         , 'Middle UX Designer'
--         , 18
--         , 'N'
--         , 'weiss1'
--         );       
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Keren'
--         , 'Junior UX Designer'
--         , 34
--         , 'N'
--         , 'annaK1'
--         );

select * from staff;

-- Найти работников которым меньше 20 или больше 35
select * from staff
where age < 20 or age > 35;

-- Вывести только имя и фамилию работников, у которых есть дети.
select firstname, lastname
from staff
where has_child = 'Y';

-- Вывести имя, должность и возраст тех сотрудников, которым больше 18 и меньше 30.
select firstname, position, age
from staff
where age > 18 and age < 30;

-- varchar(max)
-- char(fixed)
-- char(5) 'abcde'

create table new_table(
	id int,
    title varchar(128),
    in_stock char(1),
    price int
);

insert into new_table
values (1, 'Notebook', 'Y', 200);

-- Создать таблицу employees
-- employee_id - целое число
-- first_name - строка, макс. 64 символа
-- last_name - строка, макс. 64 символа
-- email - строка, макс. 64 символа
-- age - целое число

create table employees(
	employee_id int,
	first_name varchar(64),
	last_name varchar(64),
	email varchar(64),
	age int
);

-- Заполните таблицу данными с помощью следующих записей:

-- Сотрудник с именем "John", фамилией "Doe", адресом электронной почты "john.doe@example.ge" и возрастом 39 лет.
-- Сотрудник с именем "Jane", фамилией "Smith", адресом электронной почты "jane.smith@example.com" и возрастом 25 лет.
-- Сотрудник с именем "Michael", фамилией "Johnson", адресом электронной почты "michael.johnson@example.am" и возрастом 22 года.
-- Сотрудник с именем "Emily", фамилией "Brown", адресом электронной почты "emily.brown@example.com" и возрастом 29 лет.

insert into employees
values (1, 'John', 'Doe', 'john.doe@example.ge', 39);

insert into employees
values (2, 'Jane', 'Smith', 'jane.smith@example.com', 25);

insert into employees 
values (3, 'Michael', 'Jonson', 'michael.johnson@example.am', 22), 
		(4, 'Emily', 'Brown', 'emily.brown@example.com', 29);
        
-- alter table имя_таблицы 
-- change переименовать
-- rename переименовать
-- modify изменить тип данных
-- add добавить новое поле
-- drop удалить поле

-- Добавить новое поле salary.
-- Удалить поле email.
-- Изменить тип данных last_name на varchar(128).

alter table employees
add salary int, 
drop email,
modify last_name varchar(128);

