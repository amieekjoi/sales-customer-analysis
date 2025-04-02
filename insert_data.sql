-- Inserting Customers
INSERT INTO Customers VALUES (1, 'Alice', 29, 'Female', 'New York');
INSERT INTO Customers VALUES (2, 'Bob', 35, 'Male', 'Los Angeles');
INSERT INTO Customers VALUES (3, 'Charlie', 42, 'Male', 'Chicago');

-- Inserting Products
INSERT INTO Products VALUES (1, 'Laptop', 'Electronics', 999.99);
INSERT INTO Products VALUES (2, 'Smartphone', 'Electronics', 699.99);
INSERT INTO Products VALUES (3, 'Coffee Maker', 'Home Appliances', 59.99);

-- Inserting Orders
INSERT INTO Orders VALUES (1, 1, '2025-03-01', 999.99);
INSERT INTO Orders VALUES (2, 2, '2025-03-02', 699.99);

-- Inserting OrderDetails
INSERT INTO OrderDetails VALUES (1, 1, 1, 1);
INSERT INTO OrderDetails VALUES (2, 2, 2, 1);

-- Inserting Payments
INSERT INTO Payments VALUES (1, 1, 'Credit Card', 'Completed');
INSERT INTO Payments VALUES (2, 2, 'PayPal', 'Completed');

-- Inserting Reviews
INSERT INTO Reviews VALUES (1, 1, 1, 5, 'Great Laptop!');
INSERT INTO Reviews VALUES (2, 2, 2, 4, 'Good Smartphone, but battery life could be better.');