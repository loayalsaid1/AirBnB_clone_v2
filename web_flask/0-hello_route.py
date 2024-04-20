#!/usr/bin/python3
"""Create a Flask web application
    initially, serving the route/
"""
from flask import Flask
from markupsafe import escape


app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route("/")
def Greet():
    """Return text: Hello HBNB!"""
    return escape("Hello HBNB!")


if __name__ == "__main__":
    app.run()
