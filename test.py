#!/usr/bin/python3
"""
Fill the database with states and cities
"""
from models import storage
from models.state import State
from models.city import City
import uuid

# Create a dictionary to hold state names and corresponding city names
states_cities = {
    "Alabama": ["Akron", "Babbie", "Calera", "Fairfield"],
    "Arizona": ["Douglas", "Kearny", "Tempe"],
    "California": ["Fremont", "Napa", "San Francisco", "San Jose", "Sonoma"],
    "Colorado": ["Denver"],
    "Florida": ["Miami", "Orlando"],
    "Georgia": [],
    "Hawaii": ["Honolulu", "Kailua", "Pearl city"],
    "Illinois": ["Chicago", "Joliet", "Naperville", "Peoria", "Urbana"],
    "Indiana": [],
    "Louisiana": ["Baton rouge", "Lafayette", "New Orleans"],
    "Minnesota": ["Saint Paul"],
    "Mississippi": ["Jackson", "Meridian", "Tupelo"],
    "Oregon": ["Eugene", "Portland"]
}

for s, c in states_cities.items():
    state = State(name=s)
    state.save()
    for cc in c:
        city = City(name=cc, state_id=state.id)
        city.save()



