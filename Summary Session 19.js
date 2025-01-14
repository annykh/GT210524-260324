// db.collection_name.countDocuments()
// db.collection_name.find().count()

// db.collection_name.aggregate([
    // {$match: },
    // {$project: },
    // {$sort: },
    // {$limit: },
    // {$group: {_id: null/'$column_name', new_column_name: {$aggregate: '$column_name'}}}
// ])

// 1. Создать коллекцию orders со свойствами _id, customer, product, amount, city используя следующие данные:

// 1 Olga Apple 15.55 Berlin
// 2 Anna Apple 10.05 Madrid
// 3 Olga Kiwi 9.6 Berlin
// 4 Anton Apple 20 Roma
// 5 Olga Banana 8 Madrid
// 6 Petr Orange 18.3 Paris

db.orders.insertMany([
    {
        _id: 1, 
        customer: 'Olga',
        product: 'Apple',
        amount: 15.55,
        city: 'Berlin'
    },
    {
        _id: 2, 
        customer: 'Anna',
        product: 'Apple',
        amount: 10.05,
        city: 'Madrid'
    },
    {
        _id: 3, 
        customer: 'Olga',
        product: 'Kiwi',
        amount: 9.6,
        city: 'Berlin'
    },
    {
        _id: 4, 
        customer: 'Anton',
        product: 'Apple',
        amount: 20,
        city: 'Roma'
    },
    {
        _id: 5, 
        customer: 'Olga',
        product: 'Banana',
        amount: 8,
        city: 'Madrid'
    },
    {
        _id: 6, 
        customer: 'Petr',
        product: 'Orange',
        amount: 18.3,
        city: 'Paris'
    }
])

// 2. Найти сколько всего было совершено покупок.
db.orders.countDocuments()
db.orders.find().count()

// 3. Найти сколько всего раз были куплены яблоки.
db.orders.find({product: 'Apple'}).count()

// 4. Вывести все документы отсортированными по стоимости покупки - от самой недорогой до самой дорогой.
db.orders.find().sort({amount: 1})

// 5. Вывести три самые дорогие покупки.
db.orders.find().sort({amount: -1}).limit(3)

// 6. Найти сколько всего покупок было совершено в Берлине
db.orders.find({city: 'Berlin'}).count()

// 7. Найти количество покупок яблок в городах Берлин и Мадрид
db.orders.find({product: 'Apple', city: {$in: ['Berlin', 'Madrid']}}).count()

db.orders.find({
    $and: [
        {product: 'Apple'},
        {city: {$in: ['Berlin', 'Madrid']}}
    ]
}).count()

// 8. Найти сколько было потрачено каждым покупателем
db.orders.aggregate([
    {$group: {_id: '$customer', total_sum: {$sum: '$amount'}}}
])

// 9. Найти сколько было потрачено на каждый товар
db.orders.aggregate([
    {$group: {_id: '$product', total_sum: {$sum: '$amount'}}}
])
