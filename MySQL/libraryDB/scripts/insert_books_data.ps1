# Database credentials
$DB_NAME = "library"
$DB_USER = "root"
$DB_PASS = "eatmydb"
$DB_HOST = "localhost"

# Variables
$CSV_FILE = "books_data.csv"
$TABLE_NAME = "books"
$BOOKS_SQL_FILE = "Create_Books_Table.sql"

# Check if the CSV file exists
if (-Not (Test-Path $CSV_FILE)) {
    Write-Host "Error: CSV file '$CSV_FILE' not found."
    exit 1
}

# Checking if the table exists in the database
$TABLE_EXISTS = mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -D $DB_NAME -e "SHOW TABLES LIKE '$TABLE_NAME'"| Out-String

if (-Not $TABLE_EXISTS) {
    # If table does not exist, create it from the SQL file
    Write-Host "Table '$TABLE_NAME' does not exist. Creating it..."
    $createTableQuery = Get-Content $BOOKS_SQL_FILE -Raw
    mysql -h $DB_HOST -u $DB_USER -p"$DB_PASS" -D $DB_NAME -e $createTableQuery

    if ($?) {
        Write-Host "Table '$TABLE_NAME' created successfully."
    }
    else {
        Write-Host "Error: Failed to create table '$TABLE_NAME'."
        exit 1
    }
}
else {
    Write-Host "Table '$TABLE_NAME' already exists."
}

# Read the CSV and insert data
Import-Csv $CSV_FILE | ForEach-Object {
    if ($_.Book_id -ne "Book_id") {
        # Prepare the values
        $Book_id = $_.Book_id
        $Book_name = $_.Book_name
        $Year = $_.Year
        $Max_Time = $_.Max_Time
        $Faculty = $_.Faculty
        $Pages = $_.Pages

        # SQL insert query
        $INSERT_QUERY = "INSERT INTO Books (Book_id, Book_name, Year, Max_Time, Faculty, Pages) 
                        VALUES ('$Book_id', '$Book_name', '$Year', '$Max_Time', '$Faculty', '$Pages');"

        # Run the insert query
        $mysqlOutput = mysql -h $DB_HOST -u $DB_USER -p"$DB_PASS" $DB_NAME -e $INSERT_QUERY 2>$null

        if ($mysqlOutput -match "ERROR") {
            Write-Host "Error: Failed to insert '$Book_name' ($Book_id)"
        }
        else {
            Write-Host "Inserted: $Book_name ($Book_id)"
        }
    }
}

Write-Host "Data insertion completed."
