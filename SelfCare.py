from . import Handler
from flask import current_app, render_template


db_handle = Handler.Handler(
    current_app.config["MYSQL_CREDS"], database="greenbasket_eshop"
)
table_data = db_handle.GetTableData("SelfCare")
db_handle.close()


@current_app.route("/SelfCare")
def SelfCare():
    return render_template("SelfCare.html", data=table_data)
