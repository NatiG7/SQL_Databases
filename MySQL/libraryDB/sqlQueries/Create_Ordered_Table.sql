CREATE TABLE Ordered(
    Order_id SERIAL PRIMARY KEY,
    Cust_id VARCHAR(9) REFERENCES Customers(Cust_id),
    Book_id INT REFERENCES Books(Book_id),
    Order_date DATETIME
);