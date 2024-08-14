#!/usr/bin/env python3
"""
This module provides a function to list all documents in a MongoDB collection.
"""

def list_all(mongo_collection):
    """
    Lists all documents in a MongoDB collection.

    Args:
        mongo_collection (pymongo.collection.Collection): The collection object to retrieve documents from.

    Returns:
        list: A list of documents in the collection, or an empty list if no documents are found.
    """
    if mongo_collection is None:
        return []
    return [doc for doc in mongo_collection.find()]
