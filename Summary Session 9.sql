-- Встроенные функции

-- Функции для работы со строками

-- CONCAT: объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить:
select concat('John', ' ', 'Smith');

use hr;
select * from employees;

-- Из таблицы employees вывести имена и фамилии сотрудников в поле full_name(представление).
select concat(first_name, ' ', last_name) as full_name
from employees;

-- CONCAT_WS: также объединяет строки, но в качестве первого параметра принимает разделитель, который будет соединять строки:
select concat_ws(' ', first_name, last_name, 'Salary =', salary, 'Email =',  email) as information
from employees;

-- LENGTH: возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину:
select length('John');

-- Вывести эл. адресс и кол/во символов в этой строке 
select email, length(email) as email_len
from employees;

-- LTRIM: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('   John '); -- 'John '

-- RTRIM: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select rtrim('   John '); -- '   John'

-- TRIM: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('   John '); -- 'John'

-- LOCATE(find, search [, start]): возвращает позицию первого вхождения подстроки find в строку search. Дополнительный параметр start позволяет установить позицию в строке search, с которой начинается поиск подстроки find. Если подстрока search не найдена, то возвращается 0:
select locate('13', 'iphone 13 pro max'); -- '8'

-- LEFT: вырезает с начала строки определенное количество символов. Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с начала строки:
select left('iphone 13 pro max', 7); -- 'iphone '

-- RIGHT: вырезает с конца строки определенное количество символов. Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с конца строки:
select right('iphone 13 pro max', 7); -- 'pro max'

-- SUBSTRING(str, start [, length]): вырезает из строки str подстроку, начиная с позиции start. Третий необязательный параметр передает количество вырезаемых символов:
select substring('iphone 13 pro max', 5); -- ne 13 pro max
select substring('iphone 13 pro max', 5, 4); -- ne 1

-- REPLACE(search, find, replace): заменяет в строке search подстроку find на подстроку replace. Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий - подстрока, на которую надо заменить:
select replace('iphone 13 pro max', '13', '15');

-- INSERT(str, start, length, insert): вставляет в строку str, заменяя length символов с позиции start подстрокой insert. Первый параметр функции - строка, второй - позиция, с которой надо заменить, третий - сколько символов с позиции start надо заменить вставляемой подстрокой, четвертый параметр - вставляемая подстрока:
select insert('iphone 13', 8, 2, '15 pro');

-- LPAD(str, length, pad): добавляет слева от строки str некоторое количество символов, которые определены в параметре pad. Количество добавляемых символов вычисляется по формуле length - LENGTH(str). Если параметр length меньше длины строки str, то эта строка усекается до length символов.
select lpad('John Smith', 20, '!'); -- '!!!!!!!!!!John Smith'

-- RPAD(str, length, pad): добавляет справа от строки str некоторое количество символов, которые определены в параметре pad. Количество добавляемых символов вычисляется по формуле length - LENGTH(str). Если параметр length меньше длины строки str, то эта строка усекается до length символов.
select rpad('John Smith', 20, '!'); -- 'John Smith!!!!!!!!!!'

-- REVERSE: переворачивает строку наоборот:
select reverse('12345');

-- LOWER: переводит строку в нижний регистр:
select lower('Apple'); -- apple

-- UPPER: переводит строку в верхний регистр
select upper('Apple'); -- APPLE

-- REPEATE(str, count): возвращает строку, которая содержит определенное количество повторов подстроки str. Количество повторов задается через параметр count.
select repeat('Tom ', 6);

select * from employees;

-- Вывести первые четыре символа из email в нижнем регистре.
select lower(left(email, 4)), left(lower(email), 4)
from employees;

-- Оператор CASE (if - else if - else)

-- CASE
-- 		When условие1 then результат1
--     When условие2 then результат2
--     When условие3 then результат3
--     ...
--     Else альтернативный результат
-- END


-- Создать новое поле chk_email типа varchar(128).
-- Заполнить поле chk_email. 
-- Если длина email меньше 3, значением chk_email будет 'Введите больше символов', 
-- если длина email больше/равно 3 и меньше 7,  значением chk_email будет 'Кол/во символов совпадает', 
-- если длина email больше/равно 7,  значением chk_email будет 'Введите меньше символов'.

alter table employees 
add column chk_email varchar(128);

select * from employees;

set sql_safe_updates = 0;

update employees
set chk_email = case
					when length(email) < 3 then 'Введите больше символов'
                    when length(email) >= 3 and length(email) < 7 then 'Кол/во символов совпадает'
                    when length(email) >= 7 then 'Введите меньше символов'
				end;
