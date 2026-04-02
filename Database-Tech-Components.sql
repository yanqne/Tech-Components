-- Tạo database
CREATE DATABASE IF NOT EXISTS tech_components_db;
USE tech_components_db;

-- Tạo bảng Users
CREATE TABLE IF NOT EXISTS Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(15),
    role VARCHAR(20) DEFAULT 'user'
);

-- Tạo bảng Categories
CREATE TABLE IF NOT EXISTS Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Tạo bảng Products
CREATE TABLE IF NOT EXISTS Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200) NOT NULL,
    Description VARCHAR(500),
    Price DECIMAL(18,2) NOT NULL,
    NumOf INT NOT NULL,
    CategoryId INT NOT NULL,
    ImageUrl VARCHAR(500),
    FOREIGN KEY (CategoryId) REFERENCES Categories(id) ON DELETE RESTRICT
);

-- Tạo bảng Orders
CREATE TABLE IF NOT EXISTS Orders (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    UserId INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(id) ON DELETE RESTRICT
);

-- Tạo bảng OrderDetails
CREATE TABLE IF NOT EXISTS OrderDetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES Products(id) ON DELETE RESTRICT
);
-- Thêm dữ liệu mẫu
INSERT INTO Categories (categoryName) VALUES 
('CPU'), ('RAM'), ('Mainboard'), ('VGA'), ('SSD'), ('PSU');

INSERT INTO Users (username, password, fullName, phoneNumber, role) VALUES 
('admin', 'admin123', 'Admin User', '0123456789', 'admin'),
('user1', 'user123', 'Nguyen Van A', '0987654321', 'user');

INSERT INTO Products (Name, Description, Price, NumOf, CategoryId, ImageUrl) VALUES
('Intel Core i5-12400', 'CPU Intel thế hệ 12', 3500000, 10, 1, 'cpu-i5.jpg'),
('Kingston 16GB DDR4', 'RAM 16GB bus 3200', 1200000, 20, 2, 'ram-16gb.jpg'),
('MSI B660M', 'Mainboard MSI', 2500000, 5, 3, 'mainboard-msi.jpg'),
('RTX 3060 12GB', 'VGA RTX 3060', 8500000, 8, 4, 'rtx3060.jpg'),
('Samsung 970 EVO 500GB', 'SSD NVMe', 1500000, 15, 5, 'ssd-samsung.jpg');
SHOW TABLES;