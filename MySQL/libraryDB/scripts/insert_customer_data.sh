#!/bin/bash

# NATI GORAL
echo -e "\n\n~~~ NATI GORAL OWNED YOUR DB~~~\n\n"

# DB Cred
DB_NAME="library"
DB_USER="nati"
DB_PASS="natidb"
DB_HOST="localhost"

# Vars
CSV_FILE="../csvData/customers_data.csv"
TABLE_NAME="Customers"
CUSTOMERS_SQL_FILE="../sqlQueries/Create_Customers_Table.sql"

# Check if csv file exists

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file '$CSV_FILE' not found."
    exit 1
fi

# Query for table if exists
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

# loop to read customer data and insert values
while IFS=',' read -r Cust_id Cust_name Faculty; do
    if [ "$Cust_id" != "Cust_id" ]; then
        # Input sterilization (xargs trim)
        Cust_id=$(echo "$Cust_id" | xargs)
        Cust_name=$(echo "$Cust_name" | xargs)
        Faculty=$(echo "$Faculty" | xargs)
        # Query and run query to serv
        INSERT_CUSTOMERS_QUERY="INSERT INTO Customers (Cust_id, Cust_name, Faculty)
                            VALUES ('$Cust_id', '$Cust_name', '$Faculty');"
        mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$INSERT_CUSTOMERS_QUERY"

        # Check if success
        if [[ $? -eq 0 ]]; then
            echo "Inserted: $Cust_name ($Cust_id), Faculty : $Faculty"
        else
            echo "Error: Failed to insert $Cust_name ($Cust_id)."
        fi
    fi
done < "$CSV_FILE"

echo "Data inserted successfully from '$CSV_FILE' into the '$TABLE_NAME' table."
