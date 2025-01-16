import json
from flask import Blueprint, request, jsonify, current_app
from . import Handler

data_get = Blueprint("get_data", __name__)  # Make sure the app object is defined


@data_get.route("/get-data", methods=["GET"])
def get_data():
    # Extract parameters from the request
    db = request.args.get("db")
    table = request.args.get("table")

    if not db or not table:
        return jsonify({"error": "Missing 'db' or 'table' parameter"}), 400

    try:
        # Use Handler to fetch data
        handler = Handler.Handler(current_app.config["MYSQL_CREDS"], database=db)
        table_data = handler.GetTableData(table)
        handler.close()
    except Exception as e:
        return jsonify({"error": str(e)}), 500

    return jsonify(table_data)


@data_get.route("/place_order", methods=["POST"])
def PlaceOrder():
    data = json.loads(request.json)
    print(data)
    handler = Handler.Handler(current_app.config["MYSQL_CREDS"], database="Bills")
    table_data = handler.GetTableData("bills")

    if table_data:
        bno = table_data[str(table_data["rows"] - 1)][0]
        uid = table_data[str(table_data["rows"] - 1)][1]
        slno = table_data[str(table_data["rows"] - 1)][6]
    else:
        bno = 9999
        uid = 0
        slno = -1

    for key in data:
        BillNo = bno + 1
        UserID = uid + 1
        SlNo = slno + 1
        ItemName = key
        Quantity = data[key]["quantity"]
        Price = data[key]["price"]
        status = "Pending"

        handler.cursor.execute(
            f"INSERT INTO bills VALUES ({BillNo}, {UserID}, '{ItemName}', {Quantity}, {Price}, '{status}', {SlNo});"
        )
        slno += 1
    handler.cursor.execute("use greenbasket_eshop;")
    handler.cursor.execute(f"INSERT INTO PendingOrders VALUES ({UserID}, {BillNo})")
    handler.connection.commit()
    handler.close()
    print("DID THE COMMITINGG")
    return jsonify({"content": "Recieved data"}), 200
