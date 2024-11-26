// 1. Создать базу данных homeworks
// 2. Создать коллекцию users и заполнить документами со следующими свойствами: _id, firstname, lastname, age, gender. Используйте следующие данные:
	
  // 1 Анатолий Ушанов 28 m
  // 2 Светлана Демидова 25 f
  // 3 Никита Иванов 33 m
  // 4 Ольга Петрова 22 f

// TASKS

// 1. В базе данных tasks создать пустую коллекцию employees.
// 2. Заполнить коллекцию свойствами _id, firstname, lastname, age, position, salary, skills.
    // 1. Inga Petrova, 27, Barista, 1500, [’preparing drinks’, ‘cleaning equipment’] 
    // 2. Boris Orlov, 36, Server, 2400, [’taking orders’, ‘suggesting meals’, ‘taking payments’]
    // 3. Ivan Demidov, 32, Chef, 3200, [’preparing food’, ‘baking bread’]
    // 4. Marina Sidorova, 22, Hostess, 1700, [’greeting guests’, ‘seating guests’, ‘answering phone calls’]
    // 5. Olga Ivanova, 43, Sommelier, 2500, [’curating a wine list’, ‘creating wine pairings’]
// 3. Вывести коллекцию employees.
// 4. Найти и исправить ошибку в коде:
//  db.employee.insertOne({_id: 1,
//           firstname: 'Lida',
//           lastname: 'Petrova',
//           age: 27,
//           salary: 1500,
//           skills: ['coding', 'team-working'])

// 5. Найти и исправить ошибку в коде:
//  db.employee.insertMany([{_id: 1,
//           firstname: 'Lida',
//           lastname: 'Petrova',
//           age: 27,
//           salary: 1500,
//           skills: ['coding', 'team-working']]})

// 6. Найти и исправить ошибки в коде:
// db.students.insertMany([
// 	{
// 	     id: 1,
// 	     name: 'Amy,
// 	     avg_mark: 5		
// 	},
// 	{
// 	     id: 2,
// 	     name: 'Sam',
// 	     avg_mark: 3		
// 	}
// 	{
// 	     id: 3,
// 	     name: 'Ben'
// 	     avg_mark: 4.7		
// 	},
// 	{
// 	     id: 4,
// 	     name: 'Max',
// 	     avg_mark: 2		
// 	}
// ))

// 7. Создать бд shop
// 8. Создать коллекцию products1 и заполнить документами (6 штук) со следующими свойствами (_id, title, price, count). Используйте следующие данные
  // 1 Велосипед 45000 12
  // 2 Самокат 1500 10
  // 3 Ролики 2000 20
  // 4 Лыжи 22000 15
  // 5 Скейт 19000 4
  // 6 Сноуборд 33000 17

// 9. Удалить коллекцию products1
// 10. Удалить бд shop
