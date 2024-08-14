#!/usr/bin/env python3
"""Insert a new document into a collection"""

def insert_school(mongo_collection, **kwargs):
    """Insert a new document into the collection"""
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
