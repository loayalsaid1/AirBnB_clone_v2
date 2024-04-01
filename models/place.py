#!/usr/bin/python3
""" Place Module for HBNB project """
from sqlalchemy import Column, String, Integer, Float, Table
from sqlalchemy import ForeignKey
from models.base_model import BaseModel, Base
from sqlalchemy.orm import relationship
from os import getenv
from models.review import Review
from models.amenity import Amenity
import models


place_amenity = Table('place_amenity', Base.metadata,
                      Column("place_id", String(60), ForeignKey('places.id'), primary_key=True),
                      Column("amenity_id", String(60), ForeignKey('amenities.id'), primary_key=True)
)


class Place(BaseModel, Base):
    """ A place to stay """
    __tablename__ = 'places'
    city_id = Column(String(60), ForeignKey('cities.id'), nullable=False)
    user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
    name = Column(String(128), nullable=False)
    description = Column(String(1024), nullable=True)
    number_rooms = Column(Integer, nullable=False, default=0)
    number_bathrooms = Column(Integer, nullable=False, default=0)
    max_guest = Column(Integer, nullable=False, default=0)
    price_by_night = Column(Integer, nullable=False, default=0)
    latitude = Column(Float, nullable=True)
    longitude = Column(Float, nullable=True)
    amenity_ids = []

    if getenv('HBNB_TYPE_STORAGE') == 'db':
        reviews = relationship("Review", cascade="all, delete",
                               backref="place")
    else:
        @property
        def reviews(self):
            instances = []
            for obj in models.storage.all(Amenity()).values():
                if obj.place_id == self.id:
                    instances.append(obj)

            return instances

    if getenv('HBNB_TYPE_STORAGE') == 'db':
        amenities = relationship('Amenity', secondary=place_amenity, viewonly=False)
    else:
        @property
        def amenities(self):
            """Get all the amenities for that place"""
            instances = []
            for obj in models.storage.all(Amenity()).values():
                if obj.place_id == self.id:
                    instances.append(obj)
            return instances
        @amenities.setter
        def amenities(self, amenity):
            """Amenity setter"""
            if not hasattr(self, 'amenity_ids'):
                self.amenity_ids = []
            if type(amenity) is not Amenity:
                return
            
            self.amenity_ids.append(amenity.id)
