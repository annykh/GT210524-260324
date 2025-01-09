// Агрегация

// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/staff.txt

db.staff.insertMany([
    {
      "name": "Alice",
      "age": 30,
      "department": "HR",
      "skills": ["communication", "organization"],
      "projects": ["Project A", "Project B"]
    },
    {
      "name": "Bob",
      "age": 35,
      "department": "IT",
      "skills": ["programming", "problem-solving"],
      "projects": ["Project C", "Project D"]
    },
    {
      "name": "Charlie",
      "age": 30,
      "department": "Finance",
      "skills": ["financial analysis", "budgeting"],
      "projects": ["Project E"]
    }, 
    {
      "name": "John",
      "age": 18,
      "department": "IT",
      "skills": ["teamwork", "organization"],
      "projects": ["Project A", "Project D"]
    },
    {
      "name": "Lily",
      "age": 35,
      "department": "IT",
      "skills": ["programming", "problem-solving"],
      "projects": ["Project C", "Project E"]
    },
    {
      "name": "Lucas",
      "age": 30,
      "department": "Finance",
      "skills": ["financial analysis", "budgeting", "problem-solving"],
      "projects": ["Project E", "Project A"]
    }, 
    {
      "name": "Van",
      "age": 30,
      "department": "Finance",
      "skills": ["teamwork", "organization", "financial analysis"],
      "projects": ["Project E", "Project D"]
    },
    {
      "name": "Laura",
      "age": 31,
      "department": "IT",
      "skills": ["programming", "problem-solving"],
      "projects": ["Project A"]
    },
    {
      "name": "Maria",
      "age": 28,
      "department": "HR",
      "skills": ["communication", "organization", "problem-solving"],
      "projects": ["Project A", "Project D"]
    }
  ])

// Кол/во документов в коллекции
db.staff.countDocuments()
db.staff.find().count()

// Кол/во сотрудников из департамента Finance
db.staff.find({department: 'Finance'}).count()

// кол/во сотрудников, которым больше 30
db.staff.find({age: {$gt: 30}}).count()

// Функция aggregate

// $match - фильтрация
// $project - проекция
// $skip - пагинация
// $limit - пагинация
// $sort - сортировка
// $group - группировка

// Агрегатные команды
// $sum
// $avg
// $min
// $max

// db.collection_name.aggregate([
//     {$match: {условие}},
//     {$project: {проекция}},
//     {$sort: {сортировка}},
//     {$skip: {пагинация}},
//     {$limit: {пагинация}},
//     {$group: {_id: null(если нет группировки)/'$поле'(поле для группировки), имя_для_нового_поля: {агр_команда: '$поле'}}}
// ])

// Вывести имя и возраст сортудников, которым больше 30, сортировать по возрасту по убыв.
db.staff.aggregate([
    {$match: {age: {$gt: 30}}},
    {$project: {name: 1, age: 1, _id: 0}},
    {$sort: {age: -1}}
])

// Вывести только имена и навыки сотрудников, из навыков вывести только первый
db.staff.find({}, {name: 1, skills: 1, _id: 0})
db.staff.find({}, {skills: {$slice: 1}})

// db.collection.find({Условие}, {Проекция/Пагинация массива})

db.staff.aggregate([
    {$project: 
        {
            name: 1, 
            _id: 0, 
            firstSkill: {$arrayElemAt: ['$skills', 0]}
        }
    }
])

// $arrayElemAt: ['$array', index]
// последний элемент индекс -1

// Вывести только имена и первые три навыка сотрудников
db.staff.aggregate([
    {$project: 
        {
            name: 1, 
            _id: 0, 
            firstSkill: {$arrayElemAt: ['$skills', 0]},
            secondSkill: {$arrayElemAt: ['$skills', 1]},
            thirdSkill: {$arrayElemAt: ['$skills', 2]}
        }
    }
])

db.staff.aggregate([
    {$project: {
        name: 1,
        _id: 0,
        firtstThreeSkills: {$slice: ['$skills', 3]}
        }
    }
])

// $slice: ['$array', кол/во эл. которое нужно вывести]

// $slice: ['$array', индекс с которого начинаем, кол/во эл. которое нужно вывести]

// Начиная со второго элемента вывести три навыка
// $slice: ['$sklls', 1, 3]


// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/workers2.txt

// Найти сумму зарплаты всех сотрудников.

// mysql
// select sum(salary) as total_sum
// from workers2;

db.workers2.aggregate([
    {$group: {_id: null, total_sum: {$sum: '$salary'}}}
])

// Найти суммы зарплат по position

// mysql
// select sum(salary) as total_sum
// from workers2
// group by position;

db.workers2.aggregate([
    {$group: {_id: '$position', total_sum: {$sum: '$salary'}}}
])

// Найти среднее значение поля salary
db.workers2.aggregate([
    {$group: {_id: null, salary_avg: {$avg: '$salary'}}}
])

// select 
// from workers2
// where 
// group
// having

// Найти сумму зарплат сотрудников, если зарплата выше 5000.
db.workers2.aggregate([
    {$match: {salary: {$gt: 5000}}},
    {$group: {_id: null, salary_sum: {$sum: '$salary'}}}
])

// mysql
// select sum(salary)
// from workers2
// where salary > 5000;

// Найти и вывести среднее значение зарплат по position, если значение больше 2000.
db.workers2.aggregate([
    {$group: {_id: '$position', avg_salary: {$avg: '$salary'}}},
    {$match: {avg_salary: {$gt: 2000}}}
])

//mysql
// select avg(salary) as avg_salary
// from workers2
// group by position
// having avg_salary > 2000;

// Найти суммы зарплат по position. Сотрировать по убыв. суммы.
db.workers2.aggregate([
    {$group: {_id: '$position', sum_salary: {$sum: '$salary'}}},
    {$sort: {sum_salary: -1}}
])

// mysql
// select sum(salary) as sum_salary
// from workers2
// group by position
// order by sum_salary desc;

// Вывести сумму зарплат сотрудников с должностью(position) Server.
db.workers2.aggregate([
    {$match: {position: 'Server'}},
    {$group: {_id: null, total_sum: {$sum: '$salary'}}}
])

db.workers2.aggregate([
    {$match: {position: 'Server'}},
    {$group: {_id: '$position', total_sum: {$sum: '$salary'}}}
])

// Найти и вывести среднее значение поля salary, если оно больше 2000.
db.workers2.aggregate([
    {$group: {_id: null, salary_avg: {$avg: '$salary'}}},
    {$match: {salary_avg: {$gt: 2000}}}
])

// Найти максимальную зарплату для каждой должности.
db.workers2.aggregate([
    {$group: {_id: '$position', max_salary: {$max: '$salary'}}}
])

// Найти максимальную зарплату среди сотрудников старше 30 лет.
db.workers2.aggregate([
    {$match: {age: {$gt: 30}}},
    {$group: {_id: null, max_salary: {$max: '$salary'}}}
])


// Вывести имя и фамилие сортудника с маскимальной зарплатой, старше 30 лет.

// mysql
// select first_name, last_name
// from workers2
// where salary = (select max(salary)
//                 from workers2
//                 where age > 30);

// select first_name, last_name
// from workers2
// where age > 30
// order by salary desc
// limit 1;

db.workers2.aggregate([
    {$match: {age: {$gt: 30}}},
    {$project: {firstname: 1, lastname: 1, salary: 1, _id: 0}},
    {$sort: {salary: -1}},
    {$limit: 1}
])

// Отобразить только имена и фамилии сотрудников, зарабатывающих больше 5000, и отсортировать их по зарплате по возрастанию.
db.workers2.aggregate([
    {$match: {salary: {$gt: 5000}}},
    {$sort: {salary: 1}},
    {$project: {firstname: 1, lastname: 1, _id: 0}}
])

db.workers2.aggregate([
    {$match: {salary: {$gt: 5000}}},
    {$project: {firstname: 1, lastname: 1, salary: 1, _id: 0}},
    {$sort: {salary: 1}}
])

// найти максимальную среднюю зарплату по должностям
db.workers2.aggregate([
    {$group: {_id: '$position', salary_avg: {$avg: '$salary'}}},
    {$sort: {salary_avg: -1}},
    {$limit: 1}
])
