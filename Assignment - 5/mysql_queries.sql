/*
-- PART 1 – EMPLOYEE MANAGEMENT
*/

CREATE DATABASE EmployeeDB_Final;
USE EmployeeDB_Final;

CREATE TABLE Departments(
 dept_id INT PRIMARY KEY AUTO_INCREMENT,
 dept_name VARCHAR(100)
);

INSERT INTO Departments VALUES
(1,'Logistics'),
(2,'Creative');

CREATE TABLE Employees(
 emp_id INT PRIMARY KEY AUTO_INCREMENT,
 emp_name VARCHAR(100),
 dept_id INT,
 manager_id INT,
 FOREIGN KEY(dept_id) REFERENCES Departments(dept_id),
 FOREIGN KEY(manager_id) REFERENCES Employees(emp_id)
);

INSERT INTO Employees VALUES
(1,'Siddhi',1,NULL),
(2,'Manav',1,1),
(3,'Harsh',2,NULL),
(4,'Tanvi',2,3);

CREATE TABLE Projects(
 proj_id INT PRIMARY KEY AUTO_INCREMENT,
 proj_name VARCHAR(100)
);

INSERT INTO Projects VALUES
(1,'Warehouse System'),
(2,'Brand Campaign'),
(3,'Delivery App');

CREATE TABLE Employee_Project(
 emp_id INT,
 proj_id INT,
 PRIMARY KEY(emp_id,proj_id),
 FOREIGN KEY(emp_id) REFERENCES Employees(emp_id),
 FOREIGN KEY(proj_id) REFERENCES Projects(proj_id)
);

INSERT INTO Employee_Project VALUES
(1,1),(1,3),(2,1),(3,2),(4,2),(4,3);

CREATE TABLE Salaries(
 emp_id INT,
 salary INT,
 FOREIGN KEY(emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Salaries VALUES
(1,62000),(2,47000),(3,51000),(4,43000);

-- Employees on multiple projects
SELECT emp_id, COUNT(proj_id) AS projects
FROM Employee_Project
GROUP BY emp_id
HAVING COUNT(proj_id) > 1;

-- Salary per department
SELECT d.dept_name, SUM(s.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.dept_id=d.dept_id
JOIN Salaries s ON e.emp_id=s.emp_id
GROUP BY d.dept_name;

-- Manager hierarchy
SELECT m.emp_name AS Manager,
       e.emp_name AS Employee
FROM Employees e
JOIN Employees m ON e.manager_id=m.emp_id;


/*
-- PART 2 – E-COMMERCE ANALYTICS
*/

CREATE DATABASE EcommerceDB_Final;
USE EcommerceDB_Final;

CREATE TABLE Products(
 product_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 price INT,
 category VARCHAR(50)
);

INSERT INTO Products VALUES
(1,'Bluetooth Speaker',3500,'Electronics'),
(2,'Denim Jacket',2800,'Fashion'),
(3,'Gaming Mouse',2200,'Electronics'),
(4,'Handbag',2600,'Fashion');

CREATE TABLE Customers(
 customer_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100)
);

INSERT INTO Customers VALUES
(1,'Aarav'),
(2,'Isha'),
(3,'Kabir');

CREATE TABLE Orders(
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 customer_id INT,
 order_date DATE,
 FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1,1,'2025-07-10'),
(2,2,'2025-07-18'),
(3,1,'2025-08-02');

CREATE TABLE Order_Items(
 order_id INT,
 product_id INT,
 quantity INT,
 FOREIGN KEY(order_id) REFERENCES Orders(order_id),
 FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1,1,1),
(1,2,2),
(2,3,1),
(3,4,2);

CREATE TABLE Reviews(
 review_id INT PRIMARY KEY AUTO_INCREMENT,
 product_id INT,
 rating INT,
 FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Reviews VALUES
(1,1,5),
(2,2,4),
(3,3,3),
(4,4,5);

-- Top selling products
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id=p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

-- Monthly sales
SELECT MONTH(order_date) AS month,
       COUNT(order_id) AS orders
FROM Orders
GROUP BY MONTH(order_date);

-- Customer purchase pattern
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- Product rating
SELECT p.name, AVG(r.rating) AS avg_rating
FROM Reviews r
JOIN Products p ON r.product_id=p.product_id
GROUP BY p.name;
