## Welcome to Sqlite

Welcome to Sqlite, a simple command-line interface (CLI) tool for interacting with SQLite databases using Ruby.

## Task

Your task is to utilize the provided `MySQLiteCLI` and `Rysqlitakaquest` classes to create a command-line interface for interacting with SQLite databases via Ruby scripts.

## Description

The `MySQLiteCLI` class provides a basic CLI interface for executing SQL-like commands on CSV files acting as database tables. It allows users to select a database, execute select queries, and handle errors gracefully.

The `Rysqlitakaquest` class acts as a query builder, allowing users to construct SQL-like queries in a more Ruby-friendly manner. It supports operations like selecting specific columns, applying conditions with `where`, and joining tables.

## Installation

To install and use Sqlite, follow these steps:

1. Make sure you have Ruby installed on your system.
2. Download the `my_sqlite_cli.rb` and `sy_sqlite_request.rb` files.
3. Place these files in your project directory.

## Usage

To use Sqlite, follow these usage instructions:

1. Open a terminal or command prompt.
2. Navigate to the directory containing the `my_sqlite_cli.rb` and `sy_sqlite_request.rb` files.
3. Run the following command to start the SQLite CLI:

```
ruby my_sqlite_cli.rb
```

4. Once the CLI is running, you can interact with it by typing commands at the `sqlite>` prompt. Supported commands include:

- `use <filename>`: Select a CSV file as the database.
- `select <columns>`: Execute a select query.
- `insert <values>`: Execute an insert query.
- `update <values>`: Execute an update query.
- `delete <values>`: Execute a delete query.
- `exit`: Exit the SQLite CLI.

5. Follow the prompts and input your desired commands to interact with the SQLite database.

Enjoy using Sqlite for your SQLite database management needs!