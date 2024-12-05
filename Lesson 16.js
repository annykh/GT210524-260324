// Проекция - вывод полей

// db.collection_name.find({Условие}, {Проекция})

// Проекция - {column_name: 1, column_name: 0}

// 1(true) - нужно вывести поле
// 0(false) - не нужно вывести поле


// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/workers.txt

// Вывести только имена и фамилии сотрудников, которым больше 30
db.emp.find(
    {age: {$gt: 30}}, 
    {firstname: 1, lastname: 1, _id: 0}
)

// Вывести все поля, кроме salary и _id сотрудников, которым больше 30
db.emp.find(
    {age: {$gt: 30}}, 
    {_id: 0, salary: 0}
)

// Вывести имена и фамилии всех сотрудников.
db.emp.find({}, {firstname: 1, lastname: 1, _id: 0})

// select firstname, lastname
// from emp;

//  Найти всех работников, чья зарплата больше 2000 и возраст больше 20. Вывести только имя, фамилию и зарплату, без _id.
db.emp.find(
    {
        salary: {$gt: 2000}, 
        age: {$gt: 20}
    },
    {
        firstname: 1, 
        lastname: 1,
        salary: 1,
        _id: 0
    }
)

db.emp.find(
    {
        $and: [
            {age: {$gt: 20}},
            {salary: {$gt: 2000}}
        ]
    },
    {
        firstname: 1, 
        lastname: 1,
        salary: 1,
        _id: 0
    }
)

// Вывести всю информацию о всех сотрудниках, кроме зарплаты.
db.emp.find({}, {salary: 0})

// Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести все поля, кроме зарплаты и ИД
db.emp.find(
    {
        $or: [
            {salary: {$lt: 3000}},
            {age: {$gt: 40}}
        ]
    },
    {   
        salary: 0, 
        _id: 0
    }
)

// Вывести сотрудников с именами Olga, Ivan и Inga.
db.emp.find({firstname: {$in: ['Olga', 'Ivan', 'Inga']}})

db.emp.find(
    {
        $or: [
            {firstname: 'Olga'},
            {firstname: 'Ivan'},
            {firstname: 'Inga'}
        ]
    }
)


// Вывести имена и фамилии всех сотрудников.
db.emp.find({}, {firstname: true, lastname: true, _id: false})

// Фильтрация по элементам массива

// Вывести сотрудников, у которых в навыках есть 'baking bread'
db.emp.find({skills: 'baking bread'})
db.emp.find({skills: {$eq: 'baking bread'}})
db.emp.find({skills: {$in: ['baking bread']}})

// Вывести сотрудников, у которых навык только 'baking bread'
db.emp.find({skills: ['baking bread']})

// Вывести сотрудников, у которых в навыках только 'baking bread'(первое значение) и 'preparing food'(второе значение)
db.emp.find({skills: ['baking bread', 'preparing food']})

// Вывести сотрудников, у которых в навыках только 'preparing food'(первое значение) и 'baking bread'(второе значение)
db.emp.find({skills: ['preparing food', 'baking bread']})

// Вывести сотрудников, у которых в навыках есть и 'baking bread', и 'preparing food'.
db.emp.find({skills: 'baking bread', skills: 'preparing food'})

// Вывести сотрудников, у которых в навыках есть или 'baking bread', или 'preparing food', или 'taking orders'
db.emp.find({skills: {$in: ['baking bread', 'preparing food', 'taking orders']}})

db.emp.find({
    $or: [
        {skills: 'baking bread'},
        {skills: 'preparing food'},
        {skills: 'taking orders'}
    ]
})

// Найти всех работников, чьи навыки не включают "baking bread".
db.emp.find({skills: {$ne: 'baking bread'}})

// Найти всех работников, чьи навыки не равны(строго) ['preparing drinks','cleaning equipment']
db.emp.find({skills: {$ne: ['preparing drinks', 'cleaning equipment']}})

// Найти всех работников, чья зарплата меньше 2000 и чьи навыки включают "greeting guests".
db.emp.find({salary: {$lt: 2000}, skills: 'greeting guests'})

// Найти сотрудников, у которых первый навык 'preparing drinks'.
db.emp.find({'skills.0': 'preparing drinks'})


// Пагинация

// select *
// from table
// limit N;

// select *
// from table
// limit M, N;

// db.collection_name.find().limit(кол/во документов, которое нужно вывести)
// db.collection_name.find().skip(кол/во документов, которое нужно пропустить)
// db.collection_name.find().limit().skip()
// db.collection_name.find().skip().limit()

// Вывести первого сотрудника, которому больше 30.
db.emp.find({age: {$gt: 30}}).limit(1)

// Вывести перового сотрудника из emp
db.emp.find().limit(1)

// Вывести всех сотрудников пропуская первых двух
db.emp.find().skip(2)

// Вывести двух сотрудников пропуская первого
db.emp.find().limit(2).skip(1)
db.emp.find().skip(1).limit(2)

// Найти сотрудников, которые зарабатывают больше 2000, вывести только первых двух.
db.emp.find({salary: {$gt: 2000}}).limit(2)

// Найти сотрудников, которые зарабатывают больше 2000 и меньше 5000. Вывести одного сотрудника, пропуская первого.
db.emp.find({salary: {$gt: 2000, $lt: 5000}}).limit(1).skip(1)

// Сортировка
// select *
// from table1
// order by column asc/desc;

// db.collection_name.find().sort({column: 1(по возр.)/-1(по убыв.)})

// Вывести всех сотрудников и сортировать их по возрасту по убыванию
db.emp.find().sort({age: -1})

// Вывести самого молодого работника
db.emp.find().sort({age: 1}).limit(1)

// Вывести трех сотрудников, которые зарабатывают меньше всего
db.emp.find().sort({salary: 1}).limit(3)
