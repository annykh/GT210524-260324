// 1. Создать базу данных company.
// 2. Создать коллекцию employees и заполнить её следующими данными:
// db.employees.insertMany([
//     { _id: 1, name: "John Doe", age: 30, department: "IT", salary: 7000, location: "New York" },
//     { _id: 2, name: "Jane Smith", age: 25, department: "HR", salary: 5000, location: "Los Angeles" },
//     { _id: 3, name: "Michael Johnson", age: 35, department: "Finance", salary: 8500, location: "Chicago" },
//     { _id: 4, name: "Emily Brown", age: 28, department: "IT", salary: 7200, location: "San Francisco" },
//     { _id: 5, name: "Daniel White", age: 40, department: "Sales", salary: 6000, location: "New York" },
//     { _id: 6, name: "Sophia Taylor", age: 32, department: "HR", salary: 5200, location: "Miami" },
//     { _id: 7, name: "Liam Williams", age: 29, department: "IT", salary: 6800, location: "Austin" },
//     { _id: 8, name: "Olivia Martinez", age: 27, department: "Finance", salary: 7700, location: "Chicago" },
//     { _id: 9, name: "Noah Brown", age: 45, department: "Sales", salary: 9000, location: "Seattle" },
//     { _id: 10, name: "Emma Davis", age: 38, department: "Marketing", salary: 5500, location: "Los Angeles" }
// ])
// 3. Найти сотрудника с точным возрастом 30 лет.
// 4. Найти всех сотрудников, чей возраст не равен 30 лет.
// 5. Найти сотрудников, чей возраст меньше 35 лет.
// 6. Найти сотрудников, чей возраст меньше или равен 29 лет.
// 7. Найти сотрудников, которые имеют зарплату больше 5000.
// 8. Найти сотрудников, чей возраст больше или равен 35 лет.
// 9. Найти сотрудников, которые работают в департаментах "IT", "HR" или "Finance".
// 10. Найти сотрудников, которые не работают в департаментах "IT", "Sales" или "HR".
// 11. Найти сотрудников с возрастом от 25 до 35 лет включительно.
// 12. Найти сотрудников, которые работают в департаменте "Sales" и зарабатывают больше 7000.
// 13. Найти сотрудников, которые работают либо в департаменте "IT", либо в департаменте "Marketing".
// 14. Найти сотрудников, которые не работают в департаменте "Finance" и имеют зарплату меньше 8000.
// 15. Найти сотрудников, чей возраст не больше 30 лет.
// 16. Найти сотрудников, которые работают в департаменте "HR".
// 17. Найти сотрудников, чей возраст больше 30 лет и зарплата меньше 8000.
// 18. Найти сотрудников, которые работают в департаменте "Marketing" или живут в "Chicago".
// 19. Найти сотрудников, которые живут не в "New York".
// 20. Найти сотрудников с зарплатой между 5000 и 8000.
