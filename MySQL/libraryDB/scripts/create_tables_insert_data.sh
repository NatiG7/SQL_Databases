#!/bin/bash

# NATI GORAL
echo -e "\n\n~~~ NATI GORAL OWNED YOUR DB~~~\n\n"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# DB Creds
DB_NAME="library"
DB_USER="nati"
DB_PASS="natidb"
DB_HOST="localhost"

# Table creation sql file
TABLE_CREATION_FILE="../sqlQueries/LibraryDB_Table_Creation.sql"
echo "Creating tables from $TABLE_CREATION_FILE . . ."

# Query to the db
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <"$TABLE_CREATION_FILE"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Tables created successfully.${NC}"
else
    echo -e "${RED}Error creating tables. Exiting.${NC}"
    exit 1
fi

# Run data insertions
echo -e "Populating tables with data from CSV files...\n"
for script in ./insert_books_data.sh ./insert_customer_data.sh ./insert_ordered_data.sh; do
    echo "Executing $script..."
    bash "$script"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}$script executed successfully.${NC}\n"
    else
        echo -e "${RED}Error executing $script. Exiting.${NC}"
        exit 1
    fi
done
