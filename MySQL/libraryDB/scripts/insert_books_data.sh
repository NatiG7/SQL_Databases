#!/bin/bash

# NATI GORAL
echo -e "\n\n~~~ NATI GORAL OWNED YOUR DB~~~\n\n"

# DB Cred
DB_NAME="library"
DB_USER="nati"
DB_PASS="natidb"
DB_HOST="localhost"

# Vars
CSV_FILE="../csvData/books_data.csv"
TABLE_NAME="Books"
BOOKS_SQL_FILE="../sqlQueries/Create_Books_Table.sql"

# Check if CSV file exists before proceeding
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file '$CSV_FILE' not found."
    exit 1
fi

# Query for table if exists
TABLE_EXISTS=$(mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -se "SHOW TABLES LIKE '$TABLE_NAME'")

if [[ -z "$TABLE_EXISTS" ]]; then
    # Run query for table creation
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <"$BOOKS_SQL_FILE"
    if [[ $? -eq 0 ]]; then
        # reminder $? is the last exit code
        echo "Table '$TABLE_NAME' created successfully."
    else
        echo "Error: Table '$TABLE_NAME' creation failed."
        exit 1
    fi
else
    echo "Table '$TABLE_NAME' already exists."
fi

# loop to read book data and insert values
while IFS=',' read -r Book_id Book_name Year Max_Time Pages Faculty; do
    if [ "$Book_id" != "Book_id" ]; then
        # Input sterilization ( xargs trims spaces )
        Book_id=$(echo "$Book_id" | xargs)
        Book_name=$(echo "$Book_name" | xargs)
        Year=$(echo "$Year" | xargs)
        Max_Time=$(echo "$Max_Time" | xargs)
        Faculty=$(echo "$Faculty" | xargs)
        Pages=$(echo "$Pages" | xargs)
        # Query and run query cmd
        INSERT_BOOKS_QUERY="INSERT INTO Books (Book_id, Book_name, Year, Max_Time, Pages, Faculty)
        VALUES ('$Book_id', '$Book_name', '$Year', '$Max_Time',  '$Pages', '$Faculty');"
        mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$INSERT_BOOKS_QUERY"
        
        # Check if success
        if [[ $? -eq 0 ]]; then
            echo "Inserted: $Book_name ($Book_id)"
        else
            echo "Error: Failed to insert '$Book_name' ($Book_id)"
        fi
    fi
done <"$CSV_FILE"

echo "Data inserted successfully from '$CSV_FILE' into the '$TABLE_NAME' table."
