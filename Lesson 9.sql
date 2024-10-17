-- Тех. описание базы: https://github.com/annykh/GT210524-260324/blob/main/%D0%A2%D0%B5%D1%85_%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5.txt

DROP DATABASE store;
CREATE DATABASE store;
USE store;

-- Таблица клиентов
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Таблица товаров
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

-- Таблица категорий товаров
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-- Таблица заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Таблица деталей заказа
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Заполнение таблицы клиентов
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Brown', 'bob@example.com'),
('Ben', 'King', 'ben@example.com'),
('Mike', 'Cors', 'mike@example.com'),
('Jack', 'Smith', 'jack@example.com'),
('Emma', 'King', 'emma@example.com');

-- Заполнение таблицы категорий товаров
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Furniture'),
('Clothing'),
('Toys');

-- Заполнение таблицы товаров
INSERT INTO products (product_name, price, category_id) VALUES
('Laptop', 1000.00, 1),
('Table', 150.00, 2),
('T-shirt', 20.00, 3),
('Bed', 100.00, 2),
('Phone', 1520.00, 1),
('Skirt', 50.00, 3);

-- Заполнение таблицы заказов
INSERT INTO orders (customer_id, order_date, total) VALUES
(1, '2024-09-10', 1020.00),
(2, '2024-09-12', 170.00),
(3, '2024-09-09', 70.00),
(4, '2024-08-09', 1520.00);

-- Заполнение таблицы деталей заказа
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1000.00),
(1, 3, 1, 20.00),
(2, 2, 1, 150.00),
(2, 3, 1, 20.00),
(3, 3, 1, 20.00),
(3, 6, 1, 50.00),
(4, 5, 1, 1520.00);

select * from categories;
select * from customers;
select * from products;
select * from order_items;
select * from orders;

-- 1. INNER JOIN: Найти все заказы и имена клиентов, которые их сделали.
select t1.order_id, t1.order_date, t1.total, t2.first_name, t2.last_name
from orders t1
join customers t2
on t1.customer_id = t2.customer_id;

-- 2. INNER JOIN: Получить список всех товаров, заказанных клиентами, с их именами.
select t1.product_name, t4.first_name, t4.last_name
from products t1
join order_items t2
on t1.product_id = t2.product_id
join orders t3
on t2.order_id = t3.order_id
join customers t4
on t3.customer_id = t4.customer_id;

-- 3. LEFT JOIN: Вывести все категории товаров, даже если в них нет товаров.
select distinct t1.category_name
from categories t1
left join products t2
on t1.category_id = t2.category_id;

-- 4. INNER JOIN: Найти заказы, общая сумма которых превышает 500, и клиентов, которые их сделали.
select t1.order_id, t2.first_name, t2.last_name, t1.total
from orders t1
join customers t2
on t1.customer_id = t2.customer_id
where t1.total > 500;

-- 5. LEFT JOIN: Получить список всех клиентов и их заказов, включая клиентов, которые не сделали заказ.
select t1.first_name, t1.last_name, t2.order_id
from customers t1
left join orders t2
on t1.customer_id = t2.customer_id;

-- 6. SELF JOIN: Найти клиентов с одинаковыми фамилиями.
select t1.first_name, t1.last_name, t2.first_name as first_name2, t2.last_name as last_name2
from customers t1
join customers t2
on t1.last_name = t2.last_name and t1.customer_id != t2.customer_id
order by t1.last_name;

-- 7. LEFT JOIN: Вывести все товары и соответствующие заказы, даже если товар не был заказан.
select t1.product_name, t3.order_id, t3.order_date
from products t1
left join order_items t2
on t1.product_id = t2.product_id
left join orders t3
on t2.order_id = t3.order_id;

-- 8. INNER JOIN: Получить список всех заказов, включающих товары из категории "Electronics".
select t1.order_id, t3.product_name, t4.category_name
from orders t1
join order_items t2
on t1.order_id = t2.order_id
join products t3
on t2.product_id = t3.product_id
join categories t4
on t3.category_id = t4.category_id
where t4.category_name = 'Electronics';

-- 9. SELF JOIN: Найти все пары товаров, где цена одного товара больше цены другого.
select t1.product_name, t1.price, t2.product_name as product2, t2.price as price2
from products t1
join products t2
on t1.price > t2.price
order by t1.product_name;

-- 10. LEFT JOIN: Получить список всех товаров, которые не были заказаны. 
select t1.product_name
from products t1
left join order_items t2
on t1.product_id = t2.product_id
where t2.order_item_id is null;
