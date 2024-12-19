// Обновление массивов

// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/staff.txt

// updateOne
// updateMany

// $push - добавление элемента в массив

// Добавить новый навык сотруднику Bob со занчением 'team working'
db.staff.updateOne(
    {name:'Bob'},
    {$push: {skills: 'team working'}}
)

db.staff.updateOne(
    {name:'Bob'},
    {$push: {age: 5}}
)
// The field 'age' must be an array but is of type int in document {_id: ObjectId('6763dab77e3291227c881b56')}

// $each - можно добавить сразу несколько значений

// Добавить новые навыки сотруднику John со значениями creativity, Javascript

db.staff.updateOne(
    {name: 'John'},
    {$push: 
        {skills: 
            {$each: ['creativity', 'Javascript']}
        }
    }
)

db.staff.updateOne(
    {name: 'John'},
    {$push: 
        {skills: 
            {$each: ['creativity', 'Javascript']}
        }
    }
)

// $addToSet - Отличие от push в том, что addToSet добавляет данные, если их еще нет в массиве(через push данные дублируются)

db.staff.updateOne(
    {name: 'John'},
    {$addToSet: 
        {skills: 
            {$each: ['creativity', 'Javascript']}
        }
    }
)

// Добавить новый навык сотруднику Lucas со значением 'MongoDB' если такого значения нет в массиве.
db.staff.updateOne(
    {name: 'Lucas'},
    {$addToSet: {skills: 'MongoDB'}}
)

// Добавить новые навыки сотруднику Maria со значениями 'teamwork', 'programming', 'Java', если таких навыков нет в массиве.
db.staff.updateOne(
    {name: 'Maria'},
    {$addToSet: 
        {skills: 
            {$each: ['teamwork', 'programming', 'Java']}
        }
    }
)


// Добавить новый проект 'Project F' для всех сотрудников.
db.staff.updateMany(
    {},
    {$addToSet: {projects: 'Project F'}}
)

// Добавить новые навыки "leadership", "creativity" для сотрудников из отдела "HR", если у них таких навыков нет.
db.staff.updateMany(
    {department: 'HR'},
    {$addToSet: 
        {skills:
            {$each: ["leadership", "creativity"]}
        }
    }
)

// $position - задает позицию в массиве для вставки элементов
// $slice -  указывает, сколько элементов оставить в массиве после вставки
// Работают только с $push и $each

//Добавить новые проекты 'Project I', 'Project L' для сотурдников из отдела Finance. Вставить новые проекты начиная с 1-ого индекса и оставить 3 проекта в массиве.
db.staff.updateMany(
    {department: 'Finance'},
    {$push: 
        {projects: 
            {$each: ['Project I', 'Project L'], $position: 1, $slice: 3}
        }
    }
)

//Добавить новые навыки 'budgeting', 'organization' для сотрудника Laura. Вставить новые навыки начиная со первого элемента(с индекса 0) и оставить 4 навыка в массиве.
db.staff.updateOne(
    {name: 'Laura'},
    {$push: 
        {skills: 
            {$each: ['budgeting', 'organization'], $position: 0, $slice: 4}
        }
    }
)

// Вставить в начало массива projects элемент 'Project A' для сотрудника с именем Van
db.staff.updateOne(
    {name: 'Van'},
    {$push: 
        {projects: 
            {$each: ['Project A'], $position: 0}
        }
    }
)

// Сотрудникам из отдела IT вставить с первым индексом навык 'Python'.
db.staff.updateMany(
    {department: 'IT'},
    {$push: 
        {skills: 
            {$each: ['Python'], $position: 1}
        }
    }
)


// $pop - позволяет удалить один эл. из массива либо первый, либо последний
// если значение 1 то удалет последний эл., если -1, то первый

// Удалить последний проект сотрудника Bob.
db.staff.updateOne(
    {name: 'Bob'},
    {$pop: {projects: 1}}
)

// Удалить первый навык сотрудника Maria
db.staff.updateOne(
    {name: 'Maria'},
    {$pop: {skills: -1}}
)

// Удалить последний проект сотрудника Alice
db.staff.updateOne(
    {name: 'Alice'},
    {$pop: {projects: 1}}
)


// $pull - удаляет каждое вхождение эл. в массив (можно удалить только один элемент)

// Удалить навык creativity у John
db.staff.updateOne(
    {name: 'John'},
    {$pull: {skills: 'creativity'}}
)

// Для сотрудиков из отдела HR удалить проект Project A
db.staff.updateMany(
    {department: 'HR'},
    {$pull: {projects: 'Project A'}}
)

// Удалить навык "financial analysis" у сотрудника "Charlie".
db.staff.updateOne(
    {name: 'Charlie'},
    {$pull: {skills: "financial analysis"}}
)

// Удалить навык 'teamwork' у всех сотрудников
db.staff.updateMany(
    {},
    {$pull: {skills: 'teamwork'}}
)


// $pullAll - удаляет несколько элементов из массива

// Удалить проекты 'Project E', 'Project I' у сотрудника Van
db.staff.updateOne(
    {name: 'Van'},
    {$pullAll: {projects: ['Project E', 'Project I']}}
)

// Удалить навыки organization, budgeting у сотрудников из отдела Finance
db.staff.updateMany(
    {department: 'Finance'},
    {$pullAll: {skills: ['organization', 'budgeting']}}
)


// deleteOne({Условие}) - удаляет один документ
// deleteMany({Условие}) - удаляет сразу несколько документов

// Удалить из коллекции сотрудника с именем Van
db.staff.deleteOne({name: 'Van'})

// Удалить документы где department = HR
db.staff.deleteMany({department: 'HR'})

// Удалить документы сотрудников, которым больше 30.
db.staff.deleteMany({age: {$gt: 30}})

// Удалить все документы из коллекции
db.staff.deleteMany({})

// Удалить коллекцию staff
db.staff.drop()
