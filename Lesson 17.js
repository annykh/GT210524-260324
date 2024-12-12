// https://github.com/annykh/GT210524-260324/blob/main/restaurants.txt

// Пагинация массива
// Оператор $slice
// find({Условие}, {Проекция/Пагинация массива})
// Пагинация массива - {array: {$slice: N(кол/во элементов которое нужно вывести)}}
// Пагинация массива - {array: {$slice: [М(кол/во элементов которое нужно пропустоть), N(кол/во элементов которое нужно вывести)]}}
// $slice: limit
// $slice: [skip, limit]

// Получить рестораны с кухней 'Italian' и вернуть первые два блюда из меню
db.restaurants.find({cuisine: 'Italian'}, {menu: {$slice: 2}})

// db.restaurants.find({cuisine: 'Italian'}, {location: {$slice: 2}})
// Логическая ошибка: location не массив


// Вывести рестораны с куней 'Japanese' и 'Mexican', вернуть только первое блюдо из меню
db.restaurants.find(
    {cuisine: {$in: ['Japanese', 'Mexican']}},
    {menu: {$slice: 1}}
)

// Вывести все рестораны, вернуть только два блюда из меню пропуская первое
db.restaurants.find({}, {menu: {$slice: [1, 2]}})


// Получить рестораны с кухней 'Mexican' и вернуть одно блюдо из меню, пропуская первые два 
db.restaurants.find({cuisine: 'Mexican'}, {menu: {$slice: [2, 1]}})

// .skip()
// .limit()
// .sort()
// .find()

// .find().sort().skip().limit()
// .find().sort().limit().skip()

// Второе блюдо в меню Burritos
// db.restaurants.find({'menu.1.name': 'Burritos'})
// db.restaurants.find({'menu.1.name': 'Burritos'}, {menu: {$slice: [1, 1]}})



// Обновление данных

// replaceOne - Если нам надо полностью заменить один документ другим.


// db.collection.replaceOne(filter, update[, options])

// filter: принимает запрос на выборку документа, который надо обновить

// update: представляет новый документ, который заместит старый при обновлении

// options: определяет дополнительные параметры при обновлении документов, основным из которых является параметр upsert.

    // Если параметр upsert имеет значение true, что mongodb будет обновлять документ, если он найден, и создавать новый, если такого документа нет. Если же он имеет значение false, то mongodb не будет создавать новый документ, если запрос на выборку не найдет ни одного документа.
    // По умолчанию false

// Полностью заменить документ, где имя Boris, фамилия Orlov на:
// имя: 'Boris',
// фамилия: 'Ivanov',
// возраст: 38,
// должность: 'Web programmer',
// salary: 3000,
// навыки: ['taking orders', 'suggesting meals', 'taking payments', 'HTML/CSS', 'Javascript', 'team working']

db.workers2.replaceOne(
    {firstname: 'Boris', lastname: 'Orlov'},
    {
        firstname: 'Boris',
        lastname: 'Ivanov',
        age: 38,
        position: 'Web programmer',
        salary: 3000,
        skills: ['taking orders', 'suggesting meals', 'taking payments', 'HTML/CSS', 'Javascript', 'team working']
    }
)

// Добавить нового сотрудника, если условие ложное
db.workers2.replaceOne(
    {firstname: 'Boris', lastname: 'Orlov'},
    {
        firstname: 'Boris',
        lastname: 'Ivanov',
        age: 38,
        position: 'Web programmer',
        salary: 3000,
        skills: ['taking orders', 'suggesting meals', 'taking payments', 'HTML/CSS', 'Javascript', 'team working']
    },
    {upsert: true}
)

// Полностью заменить документ, где _id 3 на:
// имя: ՛Den՛
// фамилия: ՛Jameson՛,
// возраст: 35,
// должность: 'server'
// зарплата: 3000
// навыки: ['taking orders', 'suggesting meals', 'taking payments']
// upsert: false

db.workers2.replaceOne(
    {_id: 3},
    {
        firstname: 'Den',
        lastname: 'Jameson',
        age: 35,
        position: 'server',
        salary: 3000,
        skills: ['taking orders', 'suggesting meals', 'taking payments']
    }
)

// updateOne(обновляет только один документ)/updateMany(обновляет множество документов) - Для обновления отдельных полей 

// db.collection.updateOne({filter}, {update})

// $set - если нужно обновить отдельное поле, или если обновляемого поля нет, то оно создается
// $inc - для увеличения значения числового поля на определенное кол/во единиц, если обновляемого поля нет, то оно создается
// $unset - для удаления поля

// Изменить должность на 'Sales manager' для сотрудника с именем Den и фамилией Jameson

// mysql
// update workers2
// set position = 'Sales manager'
// where firstname = 'Den' and lastname = 'Jameson';

db.workers2.updateOne(
    {firstname: 'Den', lastname: 'Jameson'},
    {$set: {position: 'Sales manager'}}
)

// Добавить свойство department со значением Sales для сотрудника с именем Den и фамилией Jameson
db.workers2.updateOne(
    {firstname: 'Den', lastname: 'Jameson'},
    {$set: {department: 'Sales'}}
)

// mysql
// alter table workers2
// add column department varchar(128);

// update workers2
// set department = 'Sales'
// where firstname = 'Den' and lastname = 'Jameson';

// Увеличить зарплату сотрудника с именем Boris на 2000.
db.workers2.updateOne(
    {firstname: 'Boris'},
    {$inc: {salary: 2000}}
)

// mysql
// update workers2
// set salary = salary + 2000
// where firstname = 'Boris';

// Уменьшить зарплату сотрудника с именем Marina на 500
db.workers2.updateOne(
    {firstname: 'Marina'},
    {$inc: {salary: -500}}
)

// mysql
// update workers2
// set salary = salary - 500
// where firstname = 'Marina';

// Удалить поле position для сотрудника с именем Olga
db.workers2.updateOne(
    {firstname: 'Olga'},
    {$unset: {position: 1}}
)
// 1 = true

// Удалить поля position и skills для сотрудника Marina
db.workers2.updateOne(
    {firstname: 'Marina'},
    {$unset: {position: 1, skills: 1}}
)

// Увеличить зарплаты на 500 для сотрудников 'Marina', 'Den', 'Inga'
db.workers2.updateMany(
    {firstname: {$in: ['Marina', 'Den', 'Inga']}},
    {$inc: {salary: 500}}
)

// mysql
// update workers2
// set salary = salary + 500
// where firstname in ('Marina', 'Den', 'Inga');

// Добавить новое поле commission со значением 0 для всех сотудников
db.workers2.updateMany(
    {},
    {$set: {commission: 0}}
)

// mysql
// alter table workers2
// add column commission default 0;

// Изменить значение commission на 10 для сотрудников с зарплатой выше 3000.
db.workers2.updateMany(
    {salary: {$gt: 3000}},
    {$set: {commission: 10}}
)

// Увеличить зарплату на 1000 для сотрудников старше 30.
db.workers2.updateMany(
    {age: {$gt: 30}},
    {$inc: {salary: 1000}}
)

// Удалить поле commission для всех сотрудников, кроме Ivan
db.workers2.updateMany(
    {firstname: {$ne: 'Ivan'}},
    {$unset: {commission: 1}}
)

// Для всех документов создать поле age_cat со значением 'null'.
db.workers2.updateMany(
    {},
    {$set: {age_cat: 'null'}}
)

// Если возраст сотрудников меньше 30, изменить значение поля age_cat на 'Junior'.
db.workers2.updateMany(
    {age: {$lt: 30}},
    {$set: {age_cat: 'Junior'}}
)

// Если возраст сотурдников больше/равен 30, изменить значение поля age_cat на 'Senior'.
db.workers2.updateMany(
    {age: {$gte: 30}},
    {$set: {age_cat: 'Senior'}}
)
