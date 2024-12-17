db.employees.insertMany([
    {
        firstname: 'John',
        lastname: 'Doe',
        age: 28,
        position: 'Developer',
        salary: 2500,
        skills: ['JavaScript', 'HTML', 'CSS']
    },
    {
        firstname: 'Jane',
        lastname: 'Smith',
        age: 35,
        position: 'Project Manager',
        salary: 4000,
        skills: ['Management', 'Planning', 'Team Leading']
    },
    {
        firstname: 'Mike',
        lastname: 'Johnson',
        age: 32,
        position: 'Designer',
        salary: 3000,
        skills: ['Photoshop', 'Illustrator', 'Creativity']
    },
    {
        firstname: 'Emily',
        lastname: 'Davis',
        age: 25,
        position: 'Tester',
        salary: 2000,
        skills: ['Attention to detail', 'Scripting', 'Testing']
    }
])
