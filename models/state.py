#!/usr/bin/python3
""" State Module for HBNB project """
from models.base_model import BaseModel, Base
from sqlalchemy.orm import relationship
from sqlalchemy import Column, String
from os import getenv


class State(BaseModel, Base):
    """ State class """
    __tablename__ = 'states'
    name = Column(String(128), nullable=False)

    if getenv('HBNB_TYPE_STORAGE') == 'db':
        cities = relationship('City', backref='state',
            cascade='all, delete, delete-orphan')
    else:
        @property
        def cities(self):
            """Get all the cities with state_id similer to this place id"""
            from models import storage
            from models.city import City
            instances = []
            for obj in storage.all(City).values():
                if obj.state_id == self.id:
                    instances.append(obj)

            return instances
