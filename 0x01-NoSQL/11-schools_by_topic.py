#!/usr/bin/env python3
"""Find schools with a specific topic in MongoDB."""

def schools_by_topic(mongo_collection, topic):
    """
    Find schools with a specific topic in MongoDB.

    Args:
        mongo_collection (pymongo.collection.Collection): The collection to search in.
        topic (str): The topic to search for.

    Returns:
        list: A list of documents (schools) that have the specified topic.
    """
    return list(mongo_collection.find({"topics": topic}))
