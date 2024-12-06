#! /bin/bash
# NATI GORAL
if [[ $1 == "test" ]]; then
    PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
    PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Inserting games data into database

# Clear tables
echo $($PSQL "TRUNCATE teams, games")

# Insert unique teams into teams table
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals; do
    if [[ $year != "year" ]]; then
        # Get winner_id
        winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
        
        # If not found
        if [[ -z $winner_id ]]; then
            #insert winner_id
            insert_winner_result=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
            if [[ $insert_winner_result == "INSERT 0 1" ]]; then
                # Get winner_id after inserting
                winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
                # print message
                echo Inserted into teams[winner], $winner
            fi
        fi
        
        # Get opponent_id
        opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
        
        # if not found
        if [[ -z $opponent_id ]]; then
            # Insert opponent into teams
            insert_opponent_result=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
            if [[ $insert_opponent_result == "INSERT 0 1" ]]; then
                echo Inserted into teams[opponent], $opponent
            fi
            # Get opponent_id after inserting
            opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
        fi
        
        # Game data
        existing_game=$($PSQL "SELECT game_id FROM games WHERE year=$year AND round='$round' AND winner_id=$winner_id AND opponent_id=$opponent_id")
        if [[ -z $existing_game ]]; then
            # Insert data
            game_data=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id)
            VALUES('$year', '$round', '$winner_goals', '$opponent_goals', '$winner_id', '$opponent_id')")
            if [[ $game_data == "INSERT 0 1" ]]; then
                echo "Inserted data about game $winner vs $opponent"
            fi
        fi
    fi
done
