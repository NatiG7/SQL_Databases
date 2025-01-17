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

echo -e "Show books that are not returned as Book returned column"
echo "Query : [ SELECT book_id, COALESCE(To_Date, "Not Returned") "Book Returned ?" From Borrowed; ]"
BOOKS_THAT_NOT_RETURNED="SELECT book_id, COALESCE(To_Date, 'Not Returned') 'Book Returned ?' From Borrowed;"
$MYSQL_QUERY -e "$BOOKS_THAT_NOT_RETURNED"

echo -e "Show 2 first names of customers that take CS"
echo "Query : [ SELECT Cust_name FROM Customers WHERE Faculty='CS' LIMIT 1,2; ]"
TWO_FIRST_NAMES_OF_CS="SELECT Cust_name FROM Customers WHERE Faculty='CS' LIMIT 0,2;"
$MYSQL_QUERY -e "$TWO_FIRST_NAMES_OF_CS"

echo -e "Show 2 books names, starting from the second book, less than pages 450"
echo "Query : [ SELECT Book_name FROM Books WHERE Pages < 450 LIMIT 1,2; ]"
SHOW_TWO_BOOKS_MORE_THAN_450_PAGE="SELECT Book_name FROM Books WHERE Pages < 450 LIMIT 1,2;"
$MYSQL_QUERY -e "$SHOW_TWO_BOOKS_MORE_THAN_450_PAGE"

echo -e "Show customer names ordered by ascending"
echo "Query : [ SELECT Cust_name FROM Customers ORDER BY Cust_name; ]"
SHOW_CUSTOMERS_ASC="SELECT Cust_name FROM Customers ORDER BY Cust_name;"
$MYSQL_QUERY -e "$SHOW_CUSTOMERS_ASC"

echo -e "Show customer names by faculty"
echo "Query : [ SELECT Cust_name "Customer",Faculty FROM Customers ORDER BY Faculty; ]"
SHOW_CUSTOMERS_BY_FAC="SELECT Cust_name "Customer",Faculty FROM Customers ORDER BY Faculty;"
$MYSQL_QUERY -e "$SHOW_CUSTOMERS_BY_FAC"

echo -e "Show names and page number of the 3 oldest books"
echo "Query : [ SELECT Book_name "Book Name",Pages FROM Books ORDER BY Year LIMIT 0,3; ]"
SHOW_NAMES_AND_PAGES_OLD_BOOKS_3="SELECT Book_name 'Book Name',Pages FROM Books ORDER BY Year LIMIT 0,3;"
$MYSQL_QUERY -e "$SHOW_NAMES_AND_PAGES_OLD_BOOKS_3"

echo -e "Show 3 book names with a max number of pages"
echo "Query : [ SELECT Book_name,Pages FROM Books ORDER BY Pages DESC LIMIT 0,3; ]"
SHOW_THREE_BOOKS_MOST_PAGES="SELECT Book_name,Pages FROM Books ORDER BY Pages DESC LIMIT 0,3;"
$MYSQL_QUERY -e "$SHOW_THREE_BOOKS_MOST_PAGES"

echo -e "Show all details of four newest books"
echo "Query : [ SELECT * FROM Books ORDER BY Year DESC LIMIT 0,4; ]"
FOUR_NEWSEST_BOOKS="SELECT * FROM Books ORDER BY Year DESC LIMIT 0,4;"
$MYSQL_QUERY -e "$FOUR_NEWSEST_BOOKS"

echo -e "Show calculated average pages of books containing 'System'"
echo "Query : [ SELECT AVG(Pages) FROM Books WHERE Book_name LIKE '%System%'; ]"
SHOW_BOOKS_AVG_CONTAIN_SYSTEM="SELECT FLOOR(AVG(Pages)) FROM Books WHERE Book_name LIKE '%System%';"
$MYSQL_QUERY -e "$SHOW_BOOKS_AVG_CONTAIN_SYSTEM"

echo -e "Show least pages for books from MED"
echo "Query : [ SELECT MIN(Pages) FROM Books WHERE Faculty='MED'; ]"
LEAST_PAGES_BOOKS_MED="SELECT MIN(Pages) FROM Books WHERE Faculty='MED';"
$MYSQL_QUERY -e "$LEAST_PAGES_BOOKS_MED"

echo -e "Show number of faculties that customers learn in"
echo "Query : [ SELECT COUNT(DISTINCT Faculty) FROM Customers; ]"
COUNT_FACULTIES_CUSTOMERS="SELECT COUNT(DISTINCT Faculty) FROM Customers;"
$MYSQL_QUERY -e "$COUNT_FACULTIES_CUSTOMERS"

echo -e "Show book names in the library, unique"
echo "Query : [ SELECT DISTINCT(Book_name) FROM Books; ]"
BOOK_NAMES_IN_LIBRARY="SELECT DISTINCT(Book_name) FROM Books;"
$MYSQL_QUERY -e "$BOOK_NAMES_IN_LIBRARY"

echo -e "Show years and all their books published"
echo "Query : [ SELECT Year,Count(Book_id) FROM Books GROUP BY Year; ]"
YEARS_AND_THEIR_BOOKS="SELECT Year,Count(Book_id) FROM Books GROUP BY Year;"
$MYSQL_QUERY -e "$YEARS_AND_THEIR_BOOKS"

echo -e "Show number of books grouped by faculty"
echo "Query : [ SELECT Faculty,COUNT(Book_id) FROM Books GROUP BY Faculty; ]"
NUMBER_BOOKS_BY_FACULTY="SELECT Faculty,COUNT(Book_id) FROM Books GROUP BY Faculty;"
$MYSQL_QUERY -e "$NUMBER_BOOKS_BY_FACULTY"

echo -e " Show avg num of pages on books grouped by year"
echo "Query : [ SELECT Year,AVG(Pages) FROM Books GROUP BY Year; ]"
AVG_PAGES_BY_YEAR="SELECT Year,AVG(Pages) FROM Books GROUP BY Year;"
$MYSQL_QUERY -e "$AVG_PAGES_BY_YEAR"

echo -e "Show  number of students grouped by faculty"
echo "Query : [ SELECT Faculty,COUNT(Cust_name) FROM Customers GROUP BY Faculty; ]"
NUM_STUDENTS_BY_FAC="SELECT Faculty,COUNT(Cust_name) FROM Customers GROUP BY Faculty; "
$MYSQL_QUERY -e "$NUM_STUDENTS_BY_FAC"

echo -e " Show number of books and times borrowed"
echo "Query : [ SELECT Book_id,COUNT(*) FROM Borrowed GROUP BY Book_id; ]"
BOOKS_AND_NUMBER_BORROWED="SELECT Book_id,COUNT(*) AS 'Times Borrowed' FROM Borrowed GROUP BY Book_id;"
$MYSQL_QUERY -e "$BOOKS_AND_NUMBER_BORROWED"

echo -e " Show book names that were borrowed and contain substring 'Sy' "
echo "Query : [ SELECT Book_name FROM Books,Borrowed WHERE Books.Book_id = Borrowed.Book_id AND Book_name LIKE '%Sy%'; ]"
BORROWED_CONTAIN_SY_NAMES="SELECT Book_name FROM Books,Borrowed WHERE Books.Book_id = Borrowed.Book_id AND Book_name LIKE '%Sy%';"
$MYSQL_QUERY -e "$BORROWED_CONTAIN_SY_NAMES"

echo -e " Other variation, using INNER JOIN Books and Borrowed on Book_id "
BORROWED_CONTAIN_SY_NAMES_INNER_JOIN="SELECT Book_name FROM Books INNER JOIN Borrowed ON Books.Book_id = Borrowed.Book_id WHERE Book_name LIKE '%Sy';"
$MYSQL_QUERY -e "$BORROWED_CONTAIN_SY_NAMES_INNER_JOIN"

echo -e "Show borrowed book names and calculate return times"
echo "Query : [ SELECT Book_name,ADDDATE(From_date, INTERVAL Books.Max_time DAY) FROM Books INNER JOIN Borrowed ON Books.Book_id = Borrowed.Book_id; ]"
BORROWED_BOOKS_AND_RETURN_TIMES="SELECT Book_name,ADDDATE(From_date, INTERVAL Books.Max_time DAY) FROM Books INNER JOIN Borrowed ON Books.Book_id = Borrowed.Book_id;"
$MYSQL_QUERY -e "$BORROWED_BOOKS_AND_RETURN_TIMES"

echo -e "Show names and amount of pages borrowed by those names"
echo "Query : [ SELECT Cust_name,SUM(Books.Pages) AS Pages_borrowed FROM Customers INNER JOIN Borrowed ON Customers.Cust_id = Borrowed.Cust_id INNER JOIN Books ON Books.Book_id = Borrowed.Book_id; ]"
NAMES_AND_PAGES_BORROWED="SELECT Cust_name,SUM(Books.Pages) AS Pages_borrowed FROM Customers INNER JOIN Borrowed ON Customers.Cust_id = Borrowed.Cust_id INNER JOIN Books ON Books.Book_id = Borrowed.Book_id;"
$MYSQL_QUERY -e "$NAMES_AND_PAGES_BORROWED"

echo -e "Show book names that their publishing year is bigger than the average of publishing year in CS faculty"
echo "Query : [ SELECT Book_name FROM Books WHERE Year < (SELECT AVG(Year) FROM Books WHERE Faculty = 'CS'); ]"
PUBLISH_YEAR_BIGGER_THAT_AVG_CS="SELECT Book_name FROM Books WHERE Year < (SELECT AVG(Year) FROM Books WHERE Faculty = 'CS');"
$MYSQL_QUERY -e "$PUBLISH_YEAR_BIGGER_THAT_AVG_CS"

echo -e "Show customer names that ordered books from CS"
echo "Query : [ SELECT DISTINCT Cust_name FROM Customers Where Cust_id = ALL(SELECT Cust_id FROM Ordered WHERE Customers.Cust_id = Ordered.Cust_id); ]"
CUSTOMERS_THAT_ORDERED_FROM_CS="SELECT DISTINCT Cust_name FROM Customers Where Cust_id = ALL(SELECT Cust_id FROM Ordered WHERE Customers.Cust_id = Ordered.Cust_id);"
$MYSQL_QUERY -e "$CUSTOMERS_THAT_ORDERED_FROM_CS"

echo -e " Show faculty names where max pages is bigger than min pages in faculties"
echo "Query : [ SELECT Faculty FROM Books GROUP BY Faculty HAVING MAX(Pages) > (SELECT MIN(Pages) FROM Books); ]"
FACULTIES_WHERE_MAXPAGES_BIGGER_MINPAGES="SELECT Faculty FROM Books GROUP BY Faculty HAVING MAX(Pages) > (SELECT MIN(Pages) FROM Books);"
$MYSQL_QUERY -e "$FACULTIES_WHERE_MAXPAGES_BIGGER_MINPAGES"

echo -e " Show book names that were ordered"
echo "Query : [ SELECT Book_name FROM Books WHERE Book_id IN (SELECT Book_id FROM Ordered); ]"
BOOK_NAMES_IN_ORDERED="SELECT Book_name FROM Books WHERE Book_id IN (SELECT Book_id FROM Ordered);"
$MYSQL_QUERY -e "$BOOK_NAMES_IN_ORDERED"

echo -e "\nQuery to update all books in CS, set max time = 14"
echo "Query : [ UPDATE Books SET Max_Time=14 WHERE Faculty = 'CS';  ]"

echo -e "\nQuery to update max time of anatomy book to 21"
echo "Query : [ UPDATE Books SET Max_Time=21 WHERE Book_name = 'Anatomy'; ]"

echo -e "\nQuery to update faculty to CS to all customers containing 'ar' "
echo "Query : [ UPDATE Customers SET Faculty = 'CS' WHERE Cust_name LIKE '%ar%'; ]"

echo -e "\nQuery to add 10 pages to all pages in Faculty MED"
echo "Query : [ UPDATE Books SET Pages = Pages + 10 WHERE Faculty = 'MED'; ]"

echo -e "\nQuery to add 3 borrow days to books containing substring 'System' "
echo "Query : [ UPDATE Books SET Max_Time = Max_Time + 3 WHERE Book_name LIKE '%System%'; ]"

echo -e "\nQuery to insert a new customer"
echo "Query : [ INSERT INTO Customers VALUES(555666777,'Some Customer', 'PP'); ]"
INSERT_NEW_CUSTOMER="INSERT INTO Customers VALUES(555666777,'Some Customer', 'PP');"
$MYSQL_QUERY -e "$INSERT_NEW_CUSTOMER"
$MYSQL_QUERY -e "SELECT * FROM Customers;"

echo -e "\nQuery to delete that customer 'Some Customer' "
echo "Query : [ DELETE FROM Customers WHERE Faculty = 'PP'; ]"
DELETE_NEW_CUSTOMER="DELETE FROM Customers WHERE Faculty = 'PP';"
$MYSQL_QUERY -e "$DELETE_NEW_CUSTOMER"
$MYSQL_QUERY -e "SELECT * FROM Customers;"

echo -e "\nQuery to delete books that were never ordered."
echo "Query : [ DELETE FROM Books WHERE NOT EXISTS(SELECT * FROM Ordered WHERE Books.Book_id = Ordered.Book_id); ]"
$MYSQL_QUERY -e "SELECT * FROM Books WHERE NOT EXISTS(SELECT * FROM Ordered WHERE Books.Book_id = Ordered.Book_id);"


echo -e ""
echo "Query : []"

echo -e ""
echo "Query : []"

echo -e ""
echo "Query : []"

echo -e ""
echo "Query : []"

echo -e ""
echo "Query : []"

echo -e ""
echo "Query : []"

echo -e ""
echo "Query : []"