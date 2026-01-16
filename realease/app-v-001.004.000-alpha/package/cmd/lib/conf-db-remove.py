#! /usr/bin/env python3

import argparse
import sys
import os
import json

db_file = "/mnt/storage/conf/database.json"

if __name__ == "__main__":
    session = os.environ.get("SESSION")
    args = json.load(open(f"/tmp/share/data/{session}/data.json", "r"))

    #---

    os.makedirs(os.path.dirname(db_file), exist_ok=True)

    db_json = {}
    if os.path.exists(db_file):
        db_json = json.load(open(db_file, "r"))

    # ---

    uuid = args["uuid"]

    if uuid not in db_json:
        sys.stderr.write(f"item: {uuid} not exist")
        exit

    parent = db_json[uuid]["parent"]

    if parent not in db_json:
        sys.stderr.write(f"database parent: {parent} not exist")
        exit

    # ---

    db_json.pop(uuid , None)
    data = db_json[parent]["data"]
    db_json[parent]["data"] = [ i for i in data if i != uuid ]

    # ---

    sys.stdout.write(
        json.dumps(db_json, separators=(",", ":"))
    )