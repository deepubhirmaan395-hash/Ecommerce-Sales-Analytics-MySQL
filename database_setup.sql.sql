CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Beauty'),
(5, 'Sports');

SELECT * FROM categories;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products 
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(101, 'Laptop', 1, 55000.00, 25),
(102, 'Smartphone', 1, 30000.00, 40),
(103, 'Headphones', 1, 2500.00, 80),
(104, 'Smart Watch', 1, 5000.00, 50),
(105, 'T-Shirt', 2, 999.00, 100),
(106, 'Jeans', 2, 1999.00, 70),
(107, 'Jacket', 2, 2999.00, 45),
(108, 'Blender', 3, 3500.00, 35),
(109, 'Cookware Set', 3, 4500.00, 30),
(110, 'Coffee Maker', 3, 6000.00, 20),
(111, 'Face Wash', 4, 499.00, 120),
(112, 'Perfume', 4, 2499.00, 60),
(113, 'Yoga Mat', 5, 1200.00, 75),
(114, 'Football', 5, 899.00, 90),
(115, 'Dumbbells Set', 5, 2500.00, 40);

SELECT * FROM products;

SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM products p
JOIN categories c
ON p.category_id = c.category_id;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers
(customer_id, customer_name, email, city, state, signup_date)
VALUES
(1, 'Aman Sharma', 'aman.sharma@gmail.com', 'Delhi', 'Delhi', '2024-01-15'),
(2, 'Riya Verma', 'riya.verma@gmail.com', 'Mumbai', 'Maharashtra', '2024-02-20'),
(3, 'Rahul Singh', 'rahul.singh@gmail.com', 'Bangalore', 'Karnataka', '2024-03-10'),
(4, 'Priya Gupta', 'priya.gupta@gmail.com', 'Delhi', 'Delhi', '2024-03-25'),
(5, 'Arjun Mehta', 'arjun.mehta@gmail.com', 'Pune', 'Maharashtra', '2024-04-05'),
(6, 'Neha Kapoor', 'neha.kapoor@gmail.com', 'Chennai', 'Tamil Nadu', '2024-04-18'),
(7, 'Karan Malhotra', 'karan.malhotra@gmail.com', 'Delhi', 'Delhi', '2024-05-02'),
(8, 'Sneha Iyer', 'sneha.iyer@gmail.com', 'Bangalore', 'Karnataka', '2024-05-15'),
(9, 'Vikas Yadav', 'vikas.yadav@gmail.com', 'Jaipur', 'Rajasthan', '2024-06-01'),
(10, 'Anjali Rao', 'anjali.rao@gmail.com', 'Hyderabad', 'Telangana', '2024-06-12'),
(11, 'Rohit Kumar', 'rohit.kumar@gmail.com', 'Mumbai', 'Maharashtra', '2024-07-03'),
(12, 'Simran Kaur', 'simran.kaur@gmail.com', 'Delhi', 'Delhi', '2024-07-20'),
(13, 'Nikhil Jain', 'nikhil.jain@gmail.com', 'Pune', 'Maharashtra', '2024-08-08'),
(14, 'Pooja Sharma', 'pooja.sharma@gmail.com', 'Chandigarh', 'Punjab', '2024-08-21'),
(15, 'Manish Verma', 'manish.verma@gmail.com', 'Lucknow', 'Uttar Pradesh', '2024-09-05'),
(16, 'Kavita Joshi', 'kavita.joshi@gmail.com', 'Jaipur', 'Rajasthan', '2024-09-18'),
(17, 'Aditya Singh', 'aditya.singh@gmail.com', 'Delhi', 'Delhi', '2024-10-02'),
(18, 'Megha Patel', 'megha.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2024-10-15'),
(19, 'Sahil Khan', 'sahil.khan@gmail.com', 'Hyderabad', 'Telangana', '2024-11-01'),
(20, 'Tanya Das', 'tanya.das@gmail.com', 'Kolkata', 'West Bengal', '2024-11-15');

SELECT *
FROM customers
WHERE city = 'Delhi';

SELECT 
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(1001, 1, '2025-01-05', 'Completed', 55000.00),
(1002, 2, '2025-01-08', 'Completed', 30000.00),
(1003, 3, '2025-01-12', 'Completed', 2500.00),
(1004, 4, '2025-01-18', 'Cancelled', 999.00),
(1005, 5, '2025-01-22', 'Completed', 4500.00),

(1006, 6, '2025-02-03', 'Completed', 6000.00),
(1007, 7, '2025-02-10', 'Completed', 2999.00),
(1008, 8, '2025-02-15', 'Completed', 5000.00),
(1009, 9, '2025-02-20', 'Cancelled', 1200.00),
(1010, 10, '2025-02-25', 'Completed', 899.00),

(1011, 1, '2025-03-02', 'Completed', 30000.00),
(1012, 11, '2025-03-08', 'Completed', 2499.00),
(1013, 12, '2025-03-14', 'Completed', 1999.00),
(1014, 13, '2025-03-20', 'Completed', 3500.00),
(1015, 14, '2025-03-25', 'Completed', 4500.00),

(1016, 15, '2025-04-04', 'Completed', 55000.00),
(1017, 16, '2025-04-10', 'Cancelled', 2500.00),
(1018, 17, '2025-04-16', 'Completed', 6000.00),
(1019, 18, '2025-04-22', 'Completed', 30000.00),
(1020, 19, '2025-04-28', 'Completed', 1200.00),

(1021, 20, '2025-05-03', 'Completed', 999.00),
(1022, 2, '2025-05-09', 'Completed', 2499.00),
(1023, 3, '2025-05-15', 'Completed', 2500.00),
(1024, 5, '2025-05-21', 'Completed', 4500.00),
(1025, 7, '2025-05-28', 'Completed', 2999.00),

(1026, 8, '2025-06-04', 'Completed', 5000.00),
(1027, 10, '2025-06-10', 'Completed', 899.00),
(1028, 11, '2025-06-16', 'Completed', 2499.00),
(1029, 12, '2025-06-22', 'Cancelled', 1999.00),
(1030, 15, '2025-06-28', 'Completed', 55000.00);

SELECT 
    SUM(total_amount) AS total_revenue
FROM orders
WHERE order_status = 'Completed';

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 55000),
(2, 1002, 102, 1, 30000),
(3, 1003, 103, 1, 2500),
(4, 1004, 105, 1, 999),
(5, 1005, 109, 1, 4500),

(6, 1006, 110, 1, 6000),
(7, 1007, 107, 1, 2999),
(8, 1008, 104, 1, 5000),
(9, 1009, 113, 1, 1200),
(10, 1010, 114, 1, 899),

(11, 1011, 102, 1, 30000),
(12, 1012, 112, 1, 2499),
(13, 1013, 106, 1, 1999),
(14, 1014, 108, 1, 3500),
(15, 1015, 109, 1, 4500),

(16, 1016, 101, 1, 55000),
(17, 1017, 115, 1, 2500),
(18, 1018, 110, 1, 6000),
(19, 1019, 102, 1, 30000),
(20, 1020, 113, 1, 1200),

(21, 1021, 105, 1, 999),
(22, 1022, 112, 1, 2499),
(23, 1023, 103, 1, 2500),
(24, 1024, 109, 1, 4500),
(25, 1025, 107, 1, 2999),

(26, 1026, 104, 1, 5000),
(27, 1027, 114, 1, 899),
(28, 1028, 112, 1, 2499),
(29, 1029, 106, 1, 1999),
(30, 1030, 101, 1, 55000);

SELECT
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS sales_amount
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;
    
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_name
ORDER BY total_sales DESC;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(501, 1001, '2025-01-05', 'Credit Card', 'Paid', 55000),
(502, 1002, '2025-01-08', 'UPI', 'Paid', 30000),
(503, 1003, '2025-01-12', 'Debit Card', 'Paid', 2500),
(504, 1004, '2025-01-18', 'UPI', 'Refunded', 999),
(505, 1005, '2025-01-22', 'Cash on Delivery', 'Paid', 4500),

(506, 1006, '2025-02-03', 'Credit Card', 'Paid', 6000),
(507, 1007, '2025-02-10', 'UPI', 'Paid', 2999),
(508, 1008, '2025-02-15', 'Debit Card', 'Paid', 5000),
(509, 1009, '2025-02-20', 'UPI', 'Refunded', 1200),
(510, 1010, '2025-02-25', 'Cash on Delivery', 'Paid', 899),

(511, 1011, '2025-03-02', 'Credit Card', 'Paid', 30000),
(512, 1012, '2025-03-08', 'UPI', 'Paid', 2499),
(513, 1013, '2025-03-14', 'Debit Card', 'Paid', 1999),
(514, 1014, '2025-03-20', 'UPI', 'Paid', 3500),
(515, 1015, '2025-03-25', 'Credit Card', 'Paid', 4500),

(516, 1016, '2025-04-04', 'Credit Card', 'Paid', 55000),
(517, 1017, '2025-04-10', 'UPI', 'Refunded', 2500),
(518, 1018, '2025-04-16', 'Debit Card', 'Paid', 6000),
(519, 1019, '2025-04-22', 'UPI', 'Paid', 30000),
(520, 1020, '2025-04-28', 'Cash on Delivery', 'Paid', 1200),

(521, 1021, '2025-05-03', 'UPI', 'Paid', 999),
(522, 1022, '2025-05-09', 'Credit Card', 'Paid', 2499),
(523, 1023, '2025-05-15', 'Debit Card', 'Paid', 2500),
(524, 1024, '2025-05-21', 'UPI', 'Paid', 4500),
(525, 1025, '2025-05-28', 'Credit Card', 'Paid', 2999),

(526, 1026, '2025-06-04', 'UPI', 'Paid', 5000),
(527, 1027, '2025-06-10', 'Cash on Delivery', 'Paid', 899),
(528, 1028, '2025-06-16', 'Debit Card', 'Paid', 2499),
(529, 1029, '2025-06-22', 'UPI', 'Refunded', 1999),
(530, 1030, '2025-06-28', 'Credit Card', 'Paid', 55000);

SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY total_amount DESC;

SELECT
    payment_status,
    COUNT(*) AS transactions,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status;