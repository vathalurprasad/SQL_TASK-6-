CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    gender CHAR(1)
);

INSERT INTO customers (customer_id, name, city, age, gender) VALUES
(1, 'Arjun', 'Mumbai', 28, 'M'),
(2, 'Meera', 'Delhi', 32, 'F'),
(3, 'Rahul', 'Chennai', 24, 'M'),
(4, 'Anjali', 'Kolkata', 35, 'F'),
(5, 'Kiran', 'Pune', 29, 'M'),
(6, 'Priya', 'Hyderabad', 26, 'F'),
(7, 'Vikram', 'Jaipur', 30, 'M'),
(8, 'Sneha', 'Bengaluru', 27, 'F'),
(9, 'Rohan', 'Ahmedabad', 33, 'M'),
(10, 'Isha', 'Kochi', 22, 'F'),
(11, 'Sameer', 'Nagpur', 36, 'M'),
(12, 'Neha', 'Patna', 31, 'F'),
(13, 'Manoj', 'Indore', 25, 'M'),
(14, 'Kavya', 'Surat', 34, 'F'),
(15, 'Dev', 'Bhopal', 29, 'M');

select*from customers;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO orders (order_id, customer_id, order_amount, order_date, status) VALUES
(101, 1, 2500, '2024-10-01', 'Delivered'),
(102, 2, 4800, '2024-10-02', 'Pending'),
(103, 3, 3100, '2024-10-03', 'Delivered'),
(104, 4, 6200, '2024-10-04', 'Cancelled'),
(105, 5, 1500, '2024-10-05', 'Delivered'),
(106, 6, 2900, '2024-10-06', 'Delivered'),
(107, 7, 3300, '2024-10-07', 'Pending'),
(108, 8, 2100, '2024-10-08', 'Delivered'),
(109, 9, 4100, '2024-10-09', 'Delivered'),
(110, 10, 1900, '2024-10-10', 'Cancelled'),
(111, 11, 3500, '2024-10-11', 'Delivered'),
(112, 12, 4600, '2024-10-12', 'Pending'),
(113, 13, 2500, '2024-10-13', 'Delivered'),
(114, 14, 5300, '2024-10-14', 'Delivered'),
(115, 15, 3700, '2024-10-15', 'Pending');

select*from orders;

SELECT name 
FROM customers 
WHERE customer_id IN (
  SELECT customer_id 
  FROM orders 
  WHERE order_amount > 3000
);

SELECT name 
FROM customers 
WHERE customer_id NOT IN (
  SELECT customer_id 
  FROM orders 
  WHERE status = 'Delivered'
);

SELECT name, order_amount 
FROM customers 
JOIN orders ON customers.customer_id = orders.customer_id 
WHERE order_amount = (
  SELECT MAX(order_amount) FROM orders
);

SELECT name 
FROM customers 
WHERE customer_id IN (
  SELECT customer_id 
  FROM orders 
  GROUP BY customer_id 
  HAVING COUNT(order_id) > 1
);

SELECT order_id, order_amount 
FROM orders 
WHERE customer_id IN (
  SELECT customer_id 
  FROM customers 
  WHERE gender = 'F'
);

SELECT name 
FROM customers c
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);





