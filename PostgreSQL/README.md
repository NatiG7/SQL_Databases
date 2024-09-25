# PostgreSQL Projects

## Rebuilding `universe.db`

This folder contains SQL files and resources for working with PostgreSQL databases, specifically the `universe.db`. 

### Prerequisites

Before you begin, ensure you have the following installed on your system:

- [PostgreSQL](https://www.postgresql.org/download/)
- Access to the terminal or command prompt

### Rebuilding `universe.db`

To rebuild the `universe.db` from the provided SQL file, follow these steps:

1. **Open your terminal or command prompt.**
2. **Navigate to the folder** where the `universe.sql` file is located.
3. **Run the following command:**

   ```bash
   psql -U postgres < universe.sql
   ```

This command connects to your PostgreSQL database as the `postgres` user and executes the SQL commands contained in `universe.sql`. If you have a different username, replace `postgres` with your PostgreSQL username.

## Notes

- You may be prompted to enter the password for the `postgres` user. Make sure you have the correct password available.
- If you encounter any errors, ensure that PostgreSQL is running and that the SQL file is correctly formatted.
- For additional assistance, refer to the [PostgreSQL Documentation](https://www.postgresql.org/docs/).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
