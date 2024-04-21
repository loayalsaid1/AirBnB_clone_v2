#!/usr/bin/python3
"""Create a Flask web application
    serving the route
        /,
        /hbnb,
        /c,
        /python/<text>|None,
        number/<n> only of n is a number

        /number_template/<n> only of n is a number
        /number_odd_even/<n> if n in an integer
"""
from flask import Flask, render_template
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


@app.route('/number/<int:n>')
def integers(n):
    """Server /number/<n> only if n is integer"""
    return escape(f"{n} is a number")


@app.route('/number_template/<int:n>')
def integers_template(n):
    """Rentder template 5-number.html, feeding it <n>"""
    return render_template("5-number.html", number=n)


@app.route('/number_odd_or_even/<int:n>')
def odd_or_even(n):
    """Render template 6-number_odd_or_even.py, feeding it <n>"""
    if n % 2 == 0:
        return render_template("6-number_odd_or_even.html",
                               number=n, type="even")
    else:
        return render_template("6-number_odd_or_even.html",
                               number=n, type="odd")


if __name__ == "__main__":
    app.run()
