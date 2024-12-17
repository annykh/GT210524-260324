// replaceOne(filter, update, options)

// updateOne(filter, update)
// updateMany(filter, update)

// $set
// $inc
// $unset

// 1. Создать базу данных tasks17 и коллекцию employees.
// https://github.com/annykh/GT210524-260324/blob/main/tasks17_emp.js

// 2. Полностью заменить документ сотрудника с именем John и фамилией Doe на новый.
// Новый документ:
// Имя: John
// Фамилия: Doe
// Возраст: 29
// Должность: Full Stack Developer
// Зарплата: 3500
// Навыки: ['JavaScript', 'Node.js', 'React']

db.employees.replaceOne(
    {firstname: 'John', lastname: 'Doe'},
    {
        firstname: 'John',
        lastname: 'Doe',
        age: 29,
        position: 'Full Stack Developer',
        salary: 3500,
        skills: ['JavaScript', 'Node.js', 'React']
    }
)

// 3. Увеличить зарплату на 500 всем сотрудникам старше 30 лет.
db.employees.updateMany(
    {age: {$gt: 30}},
    {$inc: {salary: 500}}
)

// 4. Добавить поле bonus со значением 0 для всех сотрудников.
db.employees.updateMany(
    {},
    {$set: {bonus: 0}}
)

// 5. Установить значение поля bonus в 100 для сотрудников с зарплатой больше 3000.
db.employees.updateMany(
    {salary: {$gt: 3000}},
    {$set: {bonus: 100}}
)

// 6. Увеличить зарплату сотрудника Emily Davis на 1000.
// 7. Уменьшить зарплату сотрудника Mike Johnson на 300.
// 8. Добавить поле department со значением IT для сотрудника Jane Smith.
// 9. Удалить поле skills у сотрудника Mike Johnson.
// 10. Удалить поле bonus для всех сотрудников, кроме Jane Smith.
// 11. Увеличить возраст на 1 всем сотрудникам младше 30 лет.
// 12. Изменить должность Emily Davis на QA Engineer.
// 13. Добавить поле experience со значением 5 для всех сотрудников старше 30 лет.
// 14. Установить значение поля experience в 2 для сотрудников младше 30 лет.
// 15. Создать новое поле position_level и установить его значение в зависимости от зарплаты:
// Junior — зарплата меньше 2500.
// Middle — зарплата от 2500 до 3500.
// Senior — зарплата больше 3500.
