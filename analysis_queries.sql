
-- 📊 Standard SQL Analysis Queries --

-- Top-selling products by total quantity sold
SELECT p.name, SUM(od.quantity) AS total_quantity_sold
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC;

-- Total sales by category
SELECT p.category, SUM(od.quantity * p.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.category;

-- Average customer spending per order
SELECT c.name, AVG(o.total_amount) AS avg_order_value
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.name;

-- Customer reviews with average ratings
SELECT c.name, p.name AS product_name, AVG(r.rating) AS avg_rating
FROM Reviews r
JOIN Customers c ON r.customer_id = c.customer_id
JOIN Products p ON r.product_id = p.product_id
GROUP BY c.name, p.name;

-- 🧠 Advanced SQL Queries --

-- Monthly sales with running total using window function
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS monthly_sales,
    SUM(SUM(total_amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS running_total
FROM Orders
GROUP BY month
ORDER BY month;

-- Identify high-value customers using CTE
WITH CustomerSales AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
)
SELECT c.name, cs.total_spent
FROM CustomerSales cs
JOIN Customers c ON c.customer_id = cs.customer_id
WHERE cs.total_spent > 1000;

-- Ranking products by sales using RANK()
SELECT
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity,
    RANK() OVER (ORDER BY SUM(od.quantity) DESC) AS sales_rank
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.name;

-- Identify repeat customers using COUNT() window function
SELECT
    c.name,
    COUNT(o.order_id) AS total_orders,
    COUNT(o.order_id) OVER (PARTITION BY c.customer_id) AS orders_by_customer
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
