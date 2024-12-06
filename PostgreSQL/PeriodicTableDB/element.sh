#!/bin/bash

# NATI GORAL

# Query Var
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# Shell script for periodic table database

if [[ -z $1 ]]; then
  echo Please provide an element as an argument.
else
  # get element from user input
  USER_SELECTION=$1

  # Get elements with user selection
  USER_ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol = '$USER_SELECTION' OR name = '$USER_SELECTION' OR CAST(atomic_number as text) = '$USER_SELECTION'")
  if [[ -z $USER_ELEMENT ]]; then
    echo "I could not find that element in the database."
  else
    IFS="|" read ATOMIC_NUMBER SYMBOL NAME <<<"$USER_ELEMENT"
    # print element info and properties
    # Query to get info about mass, melting points,type and using inner join by atomic num
    ELEMENT_PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")

    # From recieved query split in vars and print the correct message
    IFS="|" read ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<<"$ELEMENT_PROPERTIES"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi
