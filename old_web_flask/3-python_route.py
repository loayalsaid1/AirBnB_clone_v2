#!/usr/bin/python3
"""Create a Flask web application
    initially, serving the route/, /hbnb, /c, /python/<text>|None
"""
from flask import Flask
from markupsafe import escape


app = Flask(__name__)
app.url_map.strict_slashes = False


def get_spaces_back(text):
    """Replaces the '_'s with white_spaces"""
    return text.replace('_', ' ')


@app.route("/")
def Greet():
    """Return text: Hello HBNB!"""
    return escape("Hello HBNB!")


@app.route("/hbnb")
def hbnb():
    """Return text: HBNB"""
    return escape("HBNB")


@app.route('/c/<text>')
def c(text):
    """Return the text C <text>
        replacing '_' with spaces
    """
    return escape(f"C {get_spaces_back(text)}")


@app.route("/python")
@app.route("/python/<text>")
def python(text=None):
    """Return the text "Python <text>|is cool"""
    if not text:
        text = "is cool"
    else:
        text = get_spaces_back(text)
    return escape(f"Python {text}")


if __name__ == "__main__":
    app.run()
