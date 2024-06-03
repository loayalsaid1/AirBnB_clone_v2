#!/usr/bin/python3
"""Flask application to show the show the states"""


from models import storage
from flask import Flask, render_template
from models.state import State
from models.amenity import Amenity
from models.place import Place


app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/hbnb', strict_slashes=False)
def states_list():
    """Route to show all the states, places in the database and the amenties"""
    states = storage.all(State).values()
    amenities = storage.all(Amenity).values()
    places = storage.all(Place).values()

    return render_template(
        "100-hbnb.html", states=states, amenities=amenities, places=places)


@app.teardown_appcontext
def close(error):
    """Close the session after each request"""
    storage.close()


if __name__ == "__main__":
    app.run()
