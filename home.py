from . import Handler
from flask import current_app, render_template


db_handle = Handler.Handler(
    current_app.config["MYSQL_CREDS"], database="greenbasket_eshop"
)
table_data = db_handle.GetTableData("mastertable")
db_handle.close()


@current_app.route("/")
def home():
    return render_template("home.html", data=table_data)
