CREATE VIEW CSBooks AS
SELECT Book_id, Book_name, Max_time
FROM Books
WHERE
    Faculty = 'CS';

-- ORDER BY is not allowed in this query