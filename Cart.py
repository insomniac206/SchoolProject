from flask import render_template, current_app


@current_app.route("/view-cart")
def ViewCart():
    return render_template("cart.html")
