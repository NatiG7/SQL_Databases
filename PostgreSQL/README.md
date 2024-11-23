# PostgreSQL Projects

This repository contains resources for working with multiple PostgreSQL databases: **SalonDB**, **UniverseDB**, and **WorldCupDB**. It includes SQL files for creating the databases, shell scripts for querying the data, and related resources for each project.

## Table of Contents

- [SalonDB](#salondb)
- [UniverseDB](#universedb)
- [WorldCupDB](#worldcupdb)
- [Prerequisites](#prerequisites)
- [License](#license)

---

## SalonDB

This folder contains resources for the **SalonDB** database.

### Files

- `salon.sh`: Bash script for interacting with the **SalonDB**. It allows users to execute queries and manage the database.
- `salon.sql`: SQL file for setting up the **SalonDB**, including creating tables and inserting sample data.

### Usage

- **Running Queries**: Use the `salon.sh` script to interact with the database. The script is designed to help you execute queries and manage the salon database.

---

## UniverseDB

This folder contains resources for the **UniverseDB** database.

### Files

- `universe.sql`: SQL file for setting up the **UniverseDB**, including creating tables and inserting sample data.

### Usage

- **Rebuilding UniverseDB**: To rebuild the database, run the following command:

  ```bash
  psql -U postgres -f universe.sql

## WorldCupDB

This folder contains resources for the WorldCupDB database.

### Files

- `games.csv`: CSV file containing data about World Cup games.
- `insert_data.sh`: Shell script for inserting data from games.csv into the WorldCupDB.
- `queries.sh`: Shell script with pre-defined queries to run against the WorldCupDB.
- `worldcup.sql`: SQL file for setting up the WorldCupDB, including creating tables and inserting sample data.

### Usage

- **Rebuilding WorldCupDB**: To rebuild the database, run the following command:

psql -U postgres -f worldcup.sql

### Inserting Data

- After setting up the database, use the insert_data.sh script to insert the game data from games.csv into the database.
- Run the script
  ```bash
  ./insert_data.sh

### Running Queries

- Use the queries.sh script to execute predefined queries on the WorldCupDB.

   ```bash
   ./queries.sh

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **PostgreSQL**: The database management system used for all the projects in this repository.
- **Access to the terminal or command prompt**: Required for running the commands.
- **Shell**: Bash or a similar shell environment for running the shell scripts.

---

## License

This project is licensed under the [MIT License](./LICENSE). See the LICENSE file for more details.
