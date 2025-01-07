use store

db.phones.insertMany([
    {
        name: "iPhone 14",
        price: 999,
        quantity: 50,
        brand: "Apple",
        releaseYear: 2022,
        colors: ["Black", "White", "Red", "Blue"],
        memoryOptions: ["128GB", "256GB", "512GB"]
    },
    {
        name: "Samsung Galaxy S23",
        price: 899,
        quantity: 30,
        brand: "Samsung",
        releaseYear: 2023,
        colors: ["Phantom Black", "Cream", "Green"],
        memoryOptions: ["128GB", "256GB"]
    },
    {
        name: "Google Pixel 8",
        price: 799,
        quantity: 20,
        brand: "Google",
        releaseYear: 2023,
        colors: ["Obsidian", "Snow", "Hazel"],
        memoryOptions: ["128GB", "256GB"]
    },
    {
        name: "Xiaomi 13 Pro",
        price: 1099,
        quantity: 15,
        brand: "Xiaomi",
        releaseYear: 2023,
        colors: ["Black", "White", "Green"],
        memoryOptions: ["256GB", "512GB", "1TB"]
    },
    {
        name: "OnePlus 11",
        price: 699,
        quantity: 25,
        brand: "OnePlus",
        releaseYear: 2023,
        colors: ["Titan Black", "Eternal Green"],
        memoryOptions: ["128GB", "256GB"]
    },
    {
        name: "Sony Xperia 1 V",
        price: 1299,
        quantity: 10,
        brand: "Sony",
        releaseYear: 2023,
        colors: ["Black", "Silver", "Green"],
        memoryOptions: ["256GB", "512GB"]
    },
    {
        name: "Huawei Mate 60 Pro",
        price: 899,
        quantity: 18,
        brand: "Huawei",
        releaseYear: 2023,
        colors: ["Black", "White", "Purple"],
        memoryOptions: ["256GB", "512GB"]
    },
    {
        name: "Asus ROG Phone 7",
        price: 1399,
        quantity: 12,
        brand: "Asus",
        releaseYear: 2023,
        colors: ["Black", "White"],
        memoryOptions: ["256GB", "512GB", "1TB"]
    },
    {
        name: "Motorola Edge 40 Pro",
        price: 799,
        quantity: 20,
        brand: "Motorola",
        releaseYear: 2023,
        colors: ["Black", "Blue"],
        memoryOptions: ["256GB", "512GB"]
    },
    {
        name: "Realme GT 3",
        price: 649,
        quantity: 35,
        brand: "Realme",
        releaseYear: 2023,
        colors: ["Black", "Purple"],
        memoryOptions: ["128GB", "256GB", "512GB"]
    }
])
