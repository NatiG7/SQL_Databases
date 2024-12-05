# NATI GORAL

#!/bin/bash

# DB Cred
DB_NAME="library"
DB_USER="nati"
DB_PASS="testpass"
DB_HOST="localhost"

# Vars
CSV_FILE="books_data.csv"
TABLE_NAME="Books"
BOOKS_SQL_FILE="Create_Books_Table.sql"

# Check if CSV file exists before proceeding
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file '$CSV_FILE' not found."
    exit 1
fi

# Query for table if exists
TABLE_EXISTS=$(mysql -h"$DB_HOST" -u "$DB_USER" -p "$DB_PASS" -D "$DB_NAME" --silent -se "SHOW TABLES LIKE '$TABLE_NAME'")

if [[ -z "$TABLE_EXISTS" ]]; then
    # Has if not exists inside file.
    mysql -h "$DB_HOST" -u "$DB_USER" -p "$DB_PASS" "$DB_NAME" <"$BOOKS_SQL_FILE"
    echo "Table '$TABLE_NAME' created."
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

# loop to read csv and insert values
while IFS=',' read -r Book_id Book_name Year Max_Time Faculty Pages; do
    if [ "$Book_id" != "Book_id" ]; then
        # Input sterilization ( xargs trims spaces )
        Book_id=$(echo "$Book_id" | xargs)
        Book_name=$(echo "$Book_name" | xargs)
        Year=$(echo "$Year" | xargs)
        Max_Time=$(echo "$Max_Time" | xargs)
        Faculty=$(echo "$Faculty" | xargs)
        Pages=$(echo "$Pages" | xargs)
        # Query and run query cmd
        INSERT_QUERY="INSERT INTO Books (Book_id, Book_name, Year, Max_Time, Faculty, Pages)
        VALUES ('$Book_id', '$Book_name', '$Year', '$Max_Time', '$Faculty', '$Pages');"
        mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" --silent -e "$INSERT_QUERY"

        # Check if success
        if [[ $? -eq 0 ]]; then
            echo "Inserted: $Book_name ($Book_id)"
        else
            echo "Error: Failed to insert '$Book_name' ($Book_id)"
        fi
    fi
done <"$CSV_FILE"

echo "Data inserted successfully from '$CSV_FILE' into the 'books' table."
