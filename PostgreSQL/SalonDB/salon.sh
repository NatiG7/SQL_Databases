#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c"
#NATI GORAL
echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU() {
  echo -e "Welcome to My Salon, how can I help you?\n"
  # all services
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while IFS='|' read SERVICE_ID SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

SELECT_SERVICE() {
  SERVICE_MENU
  # Read user input
  echo -e "\nEnter the service ID: "
  read SERVICE_ID_SELECTED

  # Check if service exists
  SELECTED_SERVICE_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

  # If empty
  if [[ -z "$SELECTED_SERVICE_RESULT" ]]; then
    # If not found return again.
    echo -e "\nI could not find that service. Please try again.\n"
    SELECT_SERVICE
  else
    # Get service based on id
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SELECTED_SERVICE_RESULT'")

    # Get user phone #
    echo "What's your phone number?"
    read CUSTOMER_PHONE

    # Check if number in database
    PHONE_NUMBERS=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # If phone not found in db
    if [[ -z "$PHONE_NUMBERS" ]]; then
      # Ask for name
      echo "I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # Ask for time
    echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insert appointment to db
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]; then
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo -e "\nI'm sorry, we couldn't schedule your appointment. Please try again later."
    fi
  fi
}

# Run
SELECT_SERVICE
