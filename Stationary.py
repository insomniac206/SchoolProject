from . import Handler
from flask import current_app, render_template


db_handle = Handler.Handler(
    current_app.config["MYSQL_CREDS"], database="greenbasket_eshop"
)
table_data = db_handle.GetTableData("stationery")
db_handle.close()


@current_app.route("/Stationery")
def Stationary():
    return render_template("Stationery.html", data=table_data)
