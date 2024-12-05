CREATE TABLE Borrowed(
    Book_id INT REFERENCES Books(Book_id),
    Cust_id VARCHAR(9) REFERENCES Customers(Cust_id),
    From_date DATETIME,
    To_date DATETIME
);