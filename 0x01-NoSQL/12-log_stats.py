#!/usr/bin/env python3
"""Provides some stats about Nginx logs stored in MongoDB."""
from pymongo import MongoClient

METHODS = ["GET", "POST", "PUT", "PATCH", "DELETE"]

def log_stats(mongo_collection, option=None):
    """
    Provides statistics about Nginx logs stored in MongoDB.

    Args:
        mongo_collection (pymongo.collection.Collection): The collection containing Nginx logs.
        option (str): The HTTP method to count (optional).
        
    Prints:
        - Total number of logs.
        - Number of logs for each HTTP method.
        - Number of status checks for path "/status".
    """
    if option:
        count = mongo_collection.count_documents({"method": option})
        print(f"\tmethod {option}: {count}")
        return
    
    total_logs = mongo_collection.count_documents({})
    print(f"{total_logs} logs")

    print("Methods:")
    for method in METHODS:
        count = mongo_collection.count_documents({"method": method})
        print(f"\tmethod {method}: {count}")
    
    status_check_count = mongo_collection.count_documents({"path": "/status"})
    print(f"{status_check_count} status check")

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx_collection = client.logs.nginx
    log_stats(nginx_collection)
