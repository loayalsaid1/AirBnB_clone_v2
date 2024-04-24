#!/usr/bin/python3
"""This module defines a base class for all models in our hbnb clone"""
import uuid
from datetime import datetime
import models
from sqlalchemy.orm import declarative_base
from sqlalchemy import String, Column, DateTime


Base = declarative_base()


class BaseModel:
    """A base class for all hbnb models"""
    id = Column(String(60), primary_key=True)
    created_at = Column(DateTime, default=datetime.utcnow(),
                        nullable=False)
    updated_at = Column(DateTime, default=datetime.utcnow(),
                        nullable=False,
                        onupdate=datetime.utcnow())

    def __init__(self, *args, **kwargs):
        """Instatntiates a new model"""
        if not kwargs:
            self.id = str(uuid.uuid4())
            self.created_at = self.updated_at = datetime.now()
        else:
            if not kwargs.get('id'):
                kwargs['id'] = str(uuid.uuid4())
            if kwargs.get('created_at'):
                kwargs['updated_at'] = kwargs[
                    'created_at'] = datetime.strptime(
                    kwargs['created_at'], '%Y-%m-%dT%H:%M:%S.%f')
            else:
                kwargs['created_at'] = kwargs['updated_at'] = datetime.now()
            if kwargs.get("__class__"):
                del kwargs['__class__']
            self.__dict__.update(kwargs)

    def __str__(self):
        """Returns a string representation of the instance"""
        cls = (str(type(self)).split('.')[-1]).split('\'')[0]
        attributes = {}
        for key, value in self.__dict__.items():
            if key != '_sa_instance_state':
                attributes.update({key: value})
        return '[{}] ({}) {}'.format(cls, self.id, attributes)

    def save(self):
        """Updates updated_at with current time when instance is changed"""

        self.updated_at = datetime.now()
        models.storage.new(self)
        models.storage.save()

    def to_dict(self):
        """Convert instance into dict format"""
        dictionary = {}
        dictionary.update(self.__dict__)
        # Ugly line, Sholdn't be done like this
        dictionary.update({'__class__':
                          (str(type(self)).split('.')[-1]).split('\'')[0]})
        dictionary['created_at'] = self.created_at.isoformat()
        dictionary['updated_at'] = self.updated_at.isoformat()
        if dictionary.get('_sa_instance_state'):
            del dictionary['_sa_instance_state']

        return dictionary

    def delete(self):
        """Delete an instance from the object in the database"""
        models.storage.delete(self)
