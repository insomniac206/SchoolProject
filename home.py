from . import Handler


def serve_home(app):
    db_handle = Handler.Handler(app.config["MYSQL_CREDS"], database="greenbasket_eshop")
    table_data = db_handle.GetTableData("vegFruit")
    db_handle.close()

    @app.route("/")
    def home():
        return f"{table_data['col_headers'][0]}"

    return home
