// db.emp.insertMany([
//     {
//       _id: 1,
//       firstname: 'Inga',
//       lastname: 'Petrova',
//       age: 27,
//       position: 'Barista',
//       salary: 1500,
//       skills: ['preparing drinks', 'cleaning equipment']
//     },
//     {
//       _id: 2,
//       firstname: 'Boris',
//       lastname: 'Orlov',
//       age: 36,
//       position: 'Server',
//       salary: 2400,
//       skills: ['taking orders', 'suggesting meals', 'taking payments']
//     },
//     {
//       _id: 3,
//       firstname: 'Ivan',
//       lastname: 'Demidov',
//       age: 32,
//       position: 'Chef',
//       salary: 3200,
//       skills: ['preparing food', 'baking bread']
//     },
//     {
//       _id: 4,
//       firstname: 'Marina',
//       lastname: 'Sidorov',
//       age: 22,
//       position: 'Hostess',
//       salary: 1700,
//       skills: ['greeting guests', 'seating guests', 'answering phone calls']
//     },
//     {
//       _id: 5,
//       firstname: 'Olga',
//       lastname: 'Ivanova',
//       age: 43,
//       position: 'Sommelier',
//       salary: 2500,
//       skills: ['curating a wine list', 'creating wine pairings']
//     }
//   ])


// Выборка и фильтрация

// select *
// from table_name;

// db.collection_name.find() //чтобы извлечь все документы из коллекции

db.emp.find()

// select * 
// from table_name
// where column_name = ...;

// db.collection_name.find({Условие})

// Операторы сравнения

// $eq : значения равны - equal (column: value)
// $ne : значения не равны - not equal
// $gt : значение больше другого значения - greater than
// $gte : значение больше или равно другому значению - greater than equal
// $lt : значение меньше другого значения - less than
// $lte : значение меньше или равно другому значению - less than equal
// $in : значение соответствует одному из значений в массиве 

// db.collection_name.find({ключ: {$срав_оп: значение}})
// срав_оп - сравнительные операторы

// Вывести сотрудников с именем Olga.
db.emp.find({firstname: 'Olga'})

db.emp.find({firstname: {$eq: 'Olga'}})

// Найти работников, чьи зарпалты больше 2000.
db.emp.find({salary: {$gt: 2000}})

// Найти работников младше 30 лет
db.emp.find({age: {$lt: 30}})

// Вывести сотрудников с именами Ivan, Olga, Boris
db.emp.find({firstname: {$in: ['Ivan', 'Olga', 'Boris']}})

// Вывести всех сотурдников, корме Ivan.
db.emp.find({firstname: {$ne: 'Ivan'}})

// Вывести сотрудников с зарплатой выше 10000.
db.emp.find({salary: {$gt: 10000}})

// Логические операторы

// $and : возвращает документы, в которых выполняются оба условия
// $or : возвращает документы, в которых выполняется хотя бы одно условие
// $nor : возвращает документы, в которых оба условия не выполняются
// $not : возвращает документы, в которых условие не выполняется

// Вывести сотрудников, которым больше 20 и меньше 30.
db.emp.find({age: {$gt: 20, $lt: 30}})

db.emp.find({
    $and: 
    [
        {age: {$gt: 20}}, 
        {age: {$lt: 30}}
    ]
})

// Найти работников, чьи зарплаты находятся в диапазоне от 2000(не вкл.) до 3000(вкл.).
db.emp.find({salary: {$gt: 2000, $lte: 3000}})

db.emp.find({
    $and: [
        {salary: {$gt: 2000}},
        {salary: {$lte: 3000}}
    ]
})

// Вывести сорудников которым больше 20 и зарплата меньше 5000.
db.emp.find({
    age: {$gt: 20}, 
    salary: {$lt: 5000}
})

db.emp.find({
    $and: [
        {age: {$gt: 20}},
        {salary: {$lt: 5000}}
    ]
})

// Найти всех работников, чья зарплата меньше 3000 и имя либо Ivan либо Olga.

db.emp.find({
    salary: {$lt: 3000},
    firstname: {$in: ['Olga', 'Ivan']}
})

db.emp.find({
    $and: [
        {salary: {$lt: 3000}},
        {firstname: {$in: ['Olga', 'Ivan']}}
    ]
})

// Найти работников, которым либо больше 35, либо меньше 25.
db.emp.find({
    $or: [
        {age: {$gt: 35}},
        {age: {$lt: 25}}
    ]
})

// [-Infinity: 25] and [35: +Infinity]
// not [25:35]

db.emp.find({age: {$not: {$gte:25, $lte: 35}}})

// Найти всех работников, чья зарплата меньше 3000 или возраст больше 40.
db.emp.find({
    $or: [
        {salary: {$lt: 3000}},
        {age: {$gt: 40}}
    ]
})

// Создать коллекцию users  и заполнить документами со следующими свойствами: _id, first_name, last_name, age, gender. Используйте следующие данные:

// 1 Анатолий Ушанов 28 m
// 2 Светлана Демидова 25 f
// 3 Никита Иванов 33 m
// 4 Ольга Петрова 22 f

db.users.insertMany([
    {
        _id: 1,
        first_name: 'Анатолий',
        last_name: 'Ушанов',
        age: 28,
        gender: 'm'
    },
    {
        _id: 2,
        first_name: 'Светлана',
        last_name: 'Демидова',
        age: 25,
        gender: 'f'
    },
    {
        _id: 3,
        first_name: 'Никита',
        last_name: 'Иванов',
        age: 3,
        gender: 'm'
    },
    {
        _id: 4,
        first_name: 'Ольга',
        last_name: 'Петрова',
        age: 22,
        gender: 'f'
    }
])

// Вывести коллекцию users
db.users.find()

// Вывести данные о всех представительницах женского пола
db.users.find({gender: 'f'})

// Вывести всех пользователей, у которых имя входит в список (Анатолий, Дмитрий, Ольга, Семен)
db.users.find({first_name: {$in: ['Анатолий', 'Дмитрий', 'Ольга', 'Семен']}})

// Вывести всех пользователей кроме Светланы.
db.users.find({first_name: {$ne: 'Светлана'}})

// Вывести всех пользователей, которым не меньше 25.
db.users.find({age: {$gte: 25}})

// Найти пользователей, которым больше 20, либо у которых имя в списке ['Анатолий', 'Семен']
db.users.find({
    $or: [
        {age: {$gt: 20}},
        {first_name: {$in: ['Анатолий', 'Семен']}}
    ]
})

// Вывести данные о всех представительницах женского пола старше 20 лет
db.users.find({gender:'f', age: {$gt: 20}})

db.users.find({
    $and: [
        {gender: 'f'},
        {age: {$gt: 20}}
    ]
})


// Вывести всех пользователей, кроме представительницах женского пола старше 20 лет
db.users.find({
    $nor: [
        {gender: 'f'},
        {age: {$gt: 20}}
    ]
})

db.users.find({gender: {$not: {$eq: 'f'}}, age: {$not: {$gt: 20}}})

db.users.find({gender: {$ne: 'f'}, age: {$not: {$gt: 20}}})

db.users.find({gender: {$ne: 'f'}, age: {$lte: 20}})
