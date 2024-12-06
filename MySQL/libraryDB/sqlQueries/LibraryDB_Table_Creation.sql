-- Active: 1732885090430@@127.0.0.1@3306@library

CREATE TABLE IF NOT EXISTS Books (
    Book_id INT PRIMARY KEY,
    Book_name VARCHAR(40),
    Year INT,
    Max_time INT,
    Faculty VARCHAR(5),
    Pages INT
);

CREATE TABLE IF NOT EXISTS Customers (
    Cust_id VARCHAR(9) PRIMARY KEY,
    Cust_name VARCHAR(40),
    Faculty VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS Ordered (
    Cust_id VARCHAR(9) REFERENCES Customers (Cust_id),
    Book_id INT REFERENCES Books (Book_id),
    Order_date DATETIME
);

CREATE TABLE IF NOT EXISTS Borrowed (
    Book_id INT REFERENCES Books (Book_id),
    Cust_id VARCHAR(9) REFERENCES Customers (Cust_id),
    From_date DATETIME,
    To_date DATETIME
);