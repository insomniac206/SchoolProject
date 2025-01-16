from flask.json import jsonify
from . import Handler
from flask import render_template, current_app, request

db_handle = Handler.Handler(current_app.config["MYSQL_CREDS"], database="Bills")

table_data = db_handle.GetTableData("Bills")


@current_app.route("/orders")
def orders():
    return render_template("orders.html", data=table_data)


@current_app.route("/cancel_order", methods=["POST"])
def cancel_order():
    try:
        order_id = request.args.get("BillNo")
        condition = f"BillNo = {order_id}"
        updates = {"status": "Cancelled"}
        db_handle.UpdateTableData("bills", updates, condition)
        db_handle.DeleteTableData("greenbasket_eshop.PendingOrders", condition)
        db_handle.close()
        return jsonify({"message": f"Order {order_id} has been cancelled."}), 200

    except Exception as e:
        db_handle.close()
        return jsonify({"error": str(e)})
