import mysql.connector


# Handler to retrieve data from database
class Handler:
    def __init__(self, creds: dict, database: str) -> None:
        self.schema = {}

        try:
            self.connection = mysql.connector.connect(
                host=creds["host"],
                user=creds["user"],
                password=creds["password"],
                database=database,
            )
            self.cursor = self.connection.cursor()
        except:
            print("ERROR: Please double check the credentials and the database name.")
        else:
            self.cursor.execute("show tables;")
            self.tables = [table for table in self.cursor.fetchall()]

    def GetTableData(self, table: str) -> dict:
        data = {}

        self.cursor.execute(f"select * from {table};")
        result = self.cursor.fetchall()

        data["cols"] = len(result[0])

        for i in range(len(result)):
            data[i] = list(result[i])

        self.cursor.execute(f"desc {table};")
        data["col_headers"] = [element[0] for element in self.cursor.fetchall()]

        return data

    def close(self) -> None:
        self.connection.close()
