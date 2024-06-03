#!/usr/bin/python3
"""Flask application to show the show the states or state by id"""


from models import storage
from flask import Flask, render_template
from models.state import State


app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/states', strict_slashes=False)
def states():
    """Route to show all the states in the database"""
    states = storage.all(State).values()
    return render_template("9-states.html", states=states)


@app.route("/states/<id>")
def state_by_id(id):
    """Get a state by it's id"""
    states = storage.all(State).values()
    target = None
    for state in states:
        if state.id == id:
            target = state
            break

    return render_template("9-states.html", state=target)


@app.teardown_appcontext
def close(error):
    """Close the session after each request"""
    storage.close()


if __name__ == "__main__":
    app.run()
