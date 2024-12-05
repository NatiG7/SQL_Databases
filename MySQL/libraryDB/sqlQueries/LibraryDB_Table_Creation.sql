CREATE TABLE Books (
    Book_id INT PRIMARY KEY,
    Book_name VARCHAR(40),
    Year INT,
    Max_time INT,
    Faculty VARCHAR(5),
    Pages INT
);

CREATE TABLE Customers (
    Cust_id VARCHAR(9) PRIMARY KEY,
    Cust_name VARCHAR(40),
    Faculty VARCHAR(5)
);

CREATE TABLE Ordered (
    Cust_id VARCHAR(9) REFERENCES Customers (Cust_id),
    Book_id INT REFERENCES Books (Book_id),
    Order_date DATETIME
);

CREATE TABLE Borrowed (
    Book_id INT REFERENCES Books (Book_id),
    Cust_id VARCHAR(9) REFERENCES Customers (Cust_id),
    From_date DATETIME,
    To_date DATETIME
);