#!/usr/bin/python3
"""Flask application to show the show the states"""


from models import storage
from flask import Flask, render_template
from models.state import State
from models.amenity import Amenity


app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/hbnb_filters', strict_slashes=False)
def states_list():
    """Route to show all the states in the database and the amenties"""
    states = storage.all(State).values()
    amenities = storage.all(Amenity).values()
    return render_template(
        "10-hbnb_filters.html", states=states, amenities=amenities)


@app.teardown_appcontext
def close(error):
    """Close the session after each request"""
    storage.close()


if __name__ == "__main__":
    app.run()
