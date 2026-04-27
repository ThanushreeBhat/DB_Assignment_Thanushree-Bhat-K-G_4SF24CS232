CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE OrderItem (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Customer VALUES (1,'John','john@gmail.com');
INSERT INTO Product VALUES (1,'Phone',10000);
INSERT INTO Orders VALUES (1,1,'Placed');
INSERT INTO OrderItem VALUES (1,1,2);



INSERT INTO Customer VALUES
(2,'Aman','aman@gmail.com'),
(3,'Riya','riya@gmail.com'),
(4,'Kiran','kiran@gmail.com'),
(5,'Neha','neha@gmail.com'),
(6,'Rahul','rahul@gmail.com'),
(7,'Sneha','sneha@gmail.com'),
(8,'Arjun','arjun@gmail.com'),
(9,'Pooja','pooja@gmail.com'),
(10,'Vikram','vikram@gmail.com');

INSERT INTO Product VALUES
(1,'Phone',10000),
(2,'Laptop',50000),
(3,'Headphones',2000),
(4,'Keyboard',1500),
(5,'Mouse',800),
(6,'Monitor',12000),
(7,'Tablet',15000),
(8,'Charger',500),
(9,'Camera',25000),
(10,'Speaker',3000);
INSERT INTO Orders VALUES
(1,1,'Placed'),
(2,2,'Shipped'),
(3,3,'Delivered'),
(4,4,'Placed'),
(5,5,'Delivered'),
(6,6,'Shipped'),
(7,7,'Placed'),
(8,8,'Delivered'),
(9,9,'Placed'),
(10,10,'Shipped');
INSERT INTO OrderItem VALUES
(1,1,2),
(1,3,1),
(2,2,1),
(3,4,2),
(4,5,3),
(5,6,1),
(6,7,2),
(7,8,5),
(8,9,1),
(9,10,2);
-- 1. View all customers
SELECT * FROM Customer;

-- 2. Orders with customer names
SELECT o.order_id, c.name
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id;

-- 3. Total orders
SELECT COUNT(*) FROM Orders;

-- 4. Orders by status
SELECT status, COUNT(*)
FROM Orders
GROUP BY status;

-- 5. Products in each order
SELECT o.order_id, p.name, oi.quantity
FROM OrderItem oi
JOIN Product p ON oi.product_id = p.product_id
JOIN Orders o ON oi.order_id = o.order_id;

-- 6. Total quantity sold per product
SELECT product_id, SUM(quantity)
FROM OrderItem
GROUP BY product_id;

-- 7. Delivered orders
SELECT * FROM Orders
WHERE status='Delivered';

-- 8. High value products (>10000)
SELECT * FROM Product
WHERE price > 10000;