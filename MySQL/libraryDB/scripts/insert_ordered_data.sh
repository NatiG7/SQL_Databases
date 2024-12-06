#!/bin/bash

# NATI GORAL
echo -e "\n\n~~~ NATI GORAL OWNED YOUR DB~~~\n\n"

# DB Creds
DB_NAME="library"
DB_USER="nati"
DB_PASS="natidb"
DB_HOST="localhost"

# Vars
CSV_FILE="../csvData/ordered_data.csv"
TABLE_NAME="Ordered"
CUSTOMERS_SQL_FILE="../sqlQueries/Create_Ordered_Table.sql"

# Check if csv exists
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file "$CSV_FILE" not found."
    exit 1
else
    echo -e "Loaded file : \t"$CSV_FILE"."
fi

# Query to check if table exists
TABLE_EXISTS=$(mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -se "SHOW TABLES LIKE '$TABLE_NAME'")
if [[ -z "$TABLE_EXISTS" ]]; then
    # Run query for table creation
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <"$CUSTOMERS_SQL_FILE"
    echo "Table '$TABLE_NAME' created."
    if [[ $? -eq 0 ]]; then
        echo "Table '$TABLE_NAME' created succssfully."
    else
        echo "Error: Table '$TABLE_NAME' creation failed."
        exit 1
    fi
else
    echo "Table '$TABLE_NAME' already exists."
fi

# loop to read orders data and insert values
while IFS=',' read -r Cust_id Book_id Order_date; do
    if [ "$Cust_id" != "Cust_id" ]; then
        # Sterilize input with xargs (trim)
        Cust_id=$(echo "$Cust_id" | xargs)
        Book_id=$(echo "$Book_id" | xargs)
        Order_date=$(echo "$Order_date" | xargs)
        # Query and run query to serv
        INSERT_ORDERED_QUERY="INSERT INTO Ordered (Cust_id, Book_id, Order_date)
                                VALUES ('$Cust_id', '$Book_id', '$Order_date');"
        mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$INSERT_ORDERED_QUERY"

        # Check if success
        if [[ $? -eq 0 ]]; then
            echo "Inserted: $Book_id ($Cust_id), Date : $Order_date"
        else
            echo "Error: Failed to insert $Book_id ($Cust_id)."
        fi
    fi
done <"$CSV_FILE"

echo "Data inserted successfully from '$CSV_FILE' into the '$TABLE_NAME' table."
