#!/usr/bin/python3
"""Flask application to show the show the states"""


from models import storage
from flask import Flask, render_template
from models.state import State


app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/states_list', strict_slashes=False)
def states_list():
    """Route to show all the states in the database"""
    states = storage.all(State).values()
    return render_template("7-states_list.html", states=states)


@app.teardown_appcontext
def close(error):
    """Close the session after each request"""
    storage.close()


if __name__ == "__main__":
    app.run()
