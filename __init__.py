import os
from flask import Flask, request


def create_app(test_config=None):

    app = Flask(__name__, instance_relative_config=True)
    app.secret_key = "babooga"
    # app.config.from_mapping(SECRET_KEY="development")
    app.config["MYSQL_CREDS"] = {
        "user": "root",
        "host": "localhost",
        "password": os.environ.get("MYSQL_DB_PASS"),
    }

    if test_config is None:
        app.config.from_pyfile("config.py", silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    from .GetData import data_get

    app.register_blueprint(data_get)

    with app.app_context():

        from . import home
        from . import Vegetables
        from . import Bakery
        from . import SelfCare
        from . import Stationary
        from . import DPM
        from . import Cart

        from . import Orders

        home.home()
        Vegetables.veggies()
        Bakery.Bakery()
        SelfCare.SelfCare()
        Stationary.Stationary()
        DPM.DPM()
        Cart.ViewCart()

        Orders.orders()
        Orders.cancel_order()

        return app
