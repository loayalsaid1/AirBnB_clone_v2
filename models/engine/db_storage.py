#!/usr/bin/python3
"""Define the Database storage engine for the AirBnB clone V_2"""
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, scoped_session
from os import getenv
from models.state import Base, BaseModel
from models.user import User
from models.place import Place
from models.state import State
from models.city import City
from models.amenity import Amenity
from models.review import Review
# classes = {
#             'User': User, 'Place': Place,
#             'State': State, 'City': City, 'Amenity': Amenity,
#             'Review': Review
#             }

classes = {
            'State': State, 'City': City, 'User': User, 'Place': Place, "Review": Review
            }


class DBStorage:
    """Database storage engine"""
    __engine = None
    __session = None

    def __init__(self):
        """Initialize the DB engine instance"""
        self.__engine = create_engine("mysql+mysqldb://{}:{}@{}/{}".format(
            getenv('HBNB_MYSQL_USER'),
            getenv('HBNB_MYSQL_PWD'),
            getenv('HBNB_MYSQL_HOST'),
            getenv('HBNB_MYSQL_DB')
        ), pool_pre_ping=True)


        if getenv('HBNB_ENV') == 'test':
            Base.metadata.drop_all(self.__engine)


    def all(self, cls=None):
        """Return all the objects in the database or
            all of specifc class AKA table
        """
        instances = {}
        if cls:
            cls_objects = self.__session.query(cls).all()
            for obj in cls_objects:
                instances[f"{obj.__class__.__name__}.{obj.id}"] = obj
        else:
            for model_name, model in classes.items():
                objects = self.__session.query(model).all()
                for obj in objects:
                    instances[f"{obj.__class__.__name__}.{obj.id}"] = obj
        return instances

    def new(self, obj):
        """Add a new object to the database"""
        self.__session.add(obj)

    def save(self):
        """Commit all the changes made in the curernt session"""
        self.__session.commit()

    def delete(self, obj=None):
        """Delete <obj> from the database"""
        if obj:
            self.__session.delete(obj)

    def reload(self):
        """Reload the database tables and create connectoin vie the sessoin"""
        Base.metadata.create_all(self.__engine)

        connection_factory = sessionmaker(bind=self.__engine,
                                          expire_on_commit=False)
        Session = scoped_session(connection_factory)
        self.__session = Session()
