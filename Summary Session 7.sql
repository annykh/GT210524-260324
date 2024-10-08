use school;

select * from competencies;
select * from courses;
select * from students;
select * from students2courses;
select * from teachers;
select * from teachers2competencies;

-- OUTER JOIN - LEFT JOIN, RIGHT JOIN

-- select column1,, column2,...
-- from table1
-- left/right join table2
-- on table1.column = table2.column;

-- Вывести имена студентов и ID курсов, которые они походят.
select t1.name, t2.course_id
from students t1
join students2courses t2
on t1.id = t2.student_id;

-- Вывести имена студентов и ID курсов, если студент проходит курс, если нет вывести null.
select t1.name, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id;

select t2.name, t1.course_id
from students2courses t1
right join students t2
on t1.student_id = t2.id;

-- Вывести имена тех студентов, которые не проходят ни один курс.
select name
from students t1
left join students2courses t2
on t1.id = t2.student_id
where course_id is null;

select t1.name, t2.id, t2.student_id, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id
where t2.id is null;

-- Найти курсы, которые не посещает ни один студент
select title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where t2.id is null;

-- Вывести всех преподавателей и ID их компетенций, если они есть, если нет вывести null.
select t1.name, t2.competencies_id
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teacher_id;

-- Вывести преподавателя, у которого нет компетенций.
select t1.name
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teacher_id
where t2.competencies_id is null;

-- Найти компетенции, которых нет ни у одного преподавателя(right join).
select t2.title
from teachers2competencies t1
right join competencies t2
on t1.competencies_id = t2.id
where t1.teacher_id is null;

