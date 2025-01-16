// Созданине бд
// use db_name

// Создание пустой коллекции
// db.createCollection('collection_name')

// Создание и заполнение коллекии
// db.collection_name.insertOne({...})
// db.collection_name.insertMany([{...}, {...}, {...}])

// Выборка
// db.collection_name.find() - вывод всех документов
// db.collection_name.find({условие})

// Операторы сравнения:

// равно - : $eq
// не равно - $ne
// больше - $gt
// больше/равно - $gte
// меньше - $lt
// меньше/равно - $lte
// проверка списка - $in

// Логические операторы

// и - $and
// или - $or
// не - $not
// не (и.., и...) - $nor


// Пагинация и сотрировка
// db.collection_name.find().limit(N) - кол/во документов которое нужно вывести
// db.collection_name.find().skip(M) - кол/во документов котоое нужно пропустить
// db.collection_name.find({}, {array_name: {$slice: limit}}) - сколько эл. нужно вывести
// db.collection_name.find({}, {array_name: {$slice: [skip, limit]}}) - сколько эл. пропустить, сколько вывести
// db.collection_name.find().sort({column_name: 1/-1}) - 1 по возр., -1 по убыв.

// Проекция
// db.collection_name.find({}, {column_name: 1/0}) - 1 если нужно вывести поле, 0 если не нужно

// Обновление данных 
// db.collection_name.replaceOne({Условие}, {Документ})
// db.collection_name.updateOne({Условие}, {обновление})
// db.collection_name.updateMany({Условие}, {обновление})
// {обновление} - {$оператор: {поле: значение}}

// $set - нужно обновить поле, или создать поле
// $inc - нужно увеличить/уменьшить значение
// $unset - нужно удалить поле

// Обновление массива
// ['apple', 'kiwi', 'orange']
// {обновление} - {$оператор: {массив: значение}}

// $push - добавление элемента
// $addToSet - добавление элемента, если такого элемента нет
// $each - добавление нескольких элементов, работает с $push/$addToSet
// $pop - удаление первого(-1)/последнего(1) элемента
// $pull - удаление одного элемента
// $pullAll - удаленине нескольких элементов

// Удаление документов

// db.collection_name.deleteOne({Условие})
// db.collection_name.deleteMany({Условие})

// Удаление коллекции
// db.collection_name.drop()

// Удаление бд
// db.dropDatabase()

// Агрегации

// Кол/во документов
// db.collection_name.find().count()
// db.collection_name.countDocuments()

// Функция aggregate

// {$match: {Условие}}
// {$project: {поле: 1/0}}
// {$skip: {поле: кол/во}
// {$limit: {поле: кол/во}}
// {$sort: {поле: 1/-1}}
// {$group: {_id: null/'$поле', новое_поле_агрегации: {$агрегатный_оператор: '$поле'}}

// Агрегатные операторы

// $sum
// $avg
// $min
// $max
