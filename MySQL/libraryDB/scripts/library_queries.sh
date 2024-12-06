#!/bin/bash

# NATI GORAL
echo -e "\n\n~~~ NATI GORAL OWNED YOUR DB~~~\n\n"

# DB Cred
DB_NAME="library"
DB_USER="nati"
DB_PASS="natidb"
DB_HOST="localhost"

MYSQL_QUERY="mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" $DB_NAME"


echo -e "Show entries of books where the faculty is CS and there are more than 300 pages.\n"
echo "Query :  [ SELECT Book_name FROM Books WHERE Faculty='CS' AND Pages > 300; ]"
BOOKS_CS_AND_300P="SELECT Book_name FROM Books WHERE Faculty='CS' AND Pages > 300;"
$MYSQL_QUERY -e "$BOOKS_CS_AND_300P"

echo -e "Show entries of books where the page number is between 300 and 500"
echo "Query : [ SELECT Book_name FROM Books WHERE Pages BETWEEN 300 AND 500; ]"
BOOKS_300_AND_500="SELECT Book_name FROM Books WHERE Pages BETWEEN 300 AND 500;"
$MYSQL_QUERY -e "$BOOKS_300_AND_500"

echo -e "Show entries of books where they can be borrowed for 10 between 20 days"
echo "Query : [ SELECT Book_name FROM Books WHERE Max_time BETWEEN 10 AND 19; ]"
BOOKS_BORROW_10_AND_19="SELECT Book_name FROM Books WHERE Max_time BETWEEN 10 AND 19;"
$MYSQL_QUERY -e "$BOOKS_BORROW_10_AND_19"

echo -e "Show all books published in years 1992, 1995, and 1998"
echo "Query : [ SELECT Book_name FROM Books WHERE Year IN(1992,1995,1998); ]"
BOOKS_DIFFERENT_YEARS="SELECT Book_name FROM Books WHERE Year IN(1992,1995,1998);"
$MYSQL_QUERY -e "$BOOKS_DIFFERENT_YEARS"

echo -e "Show all book names for faculties EE and CS"
echo "Query : [ SELECT Book_name FROM Books WHERE Faculty='CS' OR Faculty='EE'; ]"
BOOKS_FROM_CS_EE="SELECT Book_name FROM Books WHERE Faculty='CS' OR Faculty='EE';"
$MYSQL_QUERY -e "$BOOKS_FROM_CS_EE"

echo -e "Show customer names with ids 12345,23456,34567"
echo "Query : [ SELECT Cust_name FROM Customers WHERE Cust_id IN(12345,23456,34567); ]"
CUSTOMERS_WITH_SPECIFIC_ID="SELECT Cust_name FROM Customers WHERE Cust_id IN(12345,23456,34567);"
$MYSQL_QUERY -e "$CUSTOMERS_WITH_SPECIFIC_ID"

echo -e "Show books names that contain Database string inside, and the before last letter is m."
echo "Query : [ SELECT Book_name FROM Books WHERE Book_name LIKE '%Database%m_'; ]"
BOOKS_WITH_DATABASE_STRING="SELECT Book_name FROM Books WHERE Book_name LIKE '%Database%m_';"
$MYSQL_QUERY -e "$BOOKS_WITH_DATABASE_STRING"

echo -e "Show book names that contain 'ar'."
echo "Query : [ SELECT Cust_name FROM Customers WHERE Cust_name LIKE '%ar%'; ]"
CUSTOMERS_WITH_AR="SELECT Cust_name FROM Customers WHERE Cust_name LIKE '%ar%';"
$MYSQL_QUERY -e "$CUSTOMERS_WITH_AR"

echo -e "Select names with first letter L"
echo "Query : [ SELECT Cust_name FROM Customers WHERE Cust_name LIKE 'L%'; ]"
CUSTOMER_NAMES_START_L="SELECT Cust_name FROM Customers WHERE Cust_name LIKE 'L%';"
$MYSQL_QUERY -e "$CUSTOMER_NAMES_START_L"

echo -e "Select book names that end in character 's'"
echo "Query : [ SELECT Book_name FROM Books WHERE Book_name LIKE '%s'; ]"
BOOK_NAMES_END_S="SELECT Book_name FROM Books WHERE Book_name LIKE '%s';"
$MYSQL_QUERY -e "$BOOK_NAMES_END_S"

echo -e "Select book names where the third character 't'"
echo "Query : [ SELECT Book_name FROM Books WHERE Book_name LIKE '__t%'; ]"
BOOK_NAMES_THIRD_CHAR_S="SELECT Book_name FROM Books WHERE Book_name LIKE '__t%';"
$MYSQL_QUERY -e "$BOOK_NAMES_THIRD_CHAR_S"

echo -e ""
echo "Query : []"