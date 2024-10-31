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

    def GetTableData(self, table: str) -> dict:
        """
        returns a dictionary containing all the data in the
        given table including the data in each row and
        the number of columns

        rows are keyed with their index (ie, 1, 2, 3 for the 1st, 2nd, 3rd row and so on)
        returns a dictionary that looks something like this:
        {
            'cols': <number of columns in the table>,
            'col_headers': [list of all the column headers],
            1: row 1,
            2: row 2,
            3: row 3,
            ...
        }
        """

        data = {}

        self.cursor.execute(f"select * from {table};")
        result = self.cursor.fetchall()

        data["cols"] = len(
            result[0]
        )  # first element of  result contains all the table headers

        for i in range(len(result)):
            data[i] = list(result[i])

        self.cursor.execute(f"desc {table};")
        data["col_headers"] = [element[0] for element in self.cursor.fetchall()]

        return data

    def close(self) -> None:
        self.connection.close()
