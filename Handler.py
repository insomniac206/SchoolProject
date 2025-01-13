import mysql.connector


# Handler to retrieve data from database
class Handler:
    def __init__(self, creds: dict, database: str) -> None:
        try:
            self.connection = mysql.connector.connect(
                host=creds["host"],
                user=creds["user"],
                password=creds["password"],
                database=database,
            )
            self.cursor = self.connection.cursor()
        except mysql.connector.errors.ProgrammingError:
            print("ERROR: Please double check the credentials and the database name.")
        else:
            self.cursor.execute("show tables;")
            self.tables = [table for table in self.cursor.fetchall()]

    def CreateTable(self, table: str, schema: dict) -> None:
        table_schema = ", ".join(
            [f"{header} {schema[header]}" for header in schema.keys()]
        )

        try:
            self.cursor.execute(f"CREATE TABLE {table}({table_schema})")
            self.connection.commit()
            print(f"Succesfully created {table}.")

        except mysql.connector.Error as e:
            print(f"Error creating the table {table}: {e}")

    def InsertValues(self, table: str, values: list) -> None:
        i_vals = ", ".join(values)

        try:
            self.cursor.execute(f"INSERT INTO {table} VALUES ({i_vals})")
            self.connection.commit()
            print(f"Successfully inserted values into {table}")

        except mysql.connector.Error as e:
            print(f"Error inserting values into {table}: {e}")

    def GetTableData(self, table: str) -> dict:
        """
        returns a dictionary containing all the data in the
        given table including the data in each row and
        the number of columns
        """

        data = {}

        self.cursor.execute(f"select * from {table};")
        result = self.cursor.fetchall()

        data["cols"] = len(
            result[0]
        )  # first element of  result contains all the table headers
        data["rows"] = len(result)

        for i in range(len(result)):
            data[i] = list(result[i])

        self.cursor.execute(f"desc {table};")
        data["col_headers"] = [element[0] for element in self.cursor.fetchall()]

        return data

    def UpdateTableData(self, table: str, updates: dict, condition: str) -> None:
        """
        Updates specific fields in a table.
        :param table: Table name
        :param updates: Dictionary of column-value pairs to update
        :param condition: SQL WHERE condition to identify rows
        """
        update_string = ", ".join([f"{col} = {updates[col]}" for col in updates.keys()])
        sql_query = f"UPDATE {table} SET {update_string} WHERE {condition};"
        try:
            self.cursor.execute(sql_query, tuple(updates.values()))
            self.connection.commit()
            print(f"Successfully updated rows in {table}.")
        except mysql.connector.Error as e:
            print(f"Error updating data: {e}")

    def DeleteTableData(self, table: str, condition: str) -> None:
        """
        Deletes rows from a table.
        :param table: Table name
        :param condition: SQL WHERE condition to identify rows
        """
        sql_query = f"DELETE FROM {table} WHERE {condition};"
        try:
            self.cursor.execute(sql_query)
            self.connection.commit()
            print(f"Successfully deleted rows from {table}.")
        except mysql.connector.Error as e:
            print(f"Error deleting data: {e}")

    def close(self) -> None:
        self.connection.close()
