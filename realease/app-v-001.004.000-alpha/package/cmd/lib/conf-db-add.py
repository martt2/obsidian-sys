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

    item = {
        "id": args['uuid'],
        "name": args['name'],
        "parent": args['database'],
        "data": []
    }

    db_json[args['uuid']] = item

    if args['database'] not in db_json:
        sys.stderr.write(f"database: {args['database']} not exist")
        exit
    
    if "data" not in db_json[args['database']]:
        db_json[args['database']]["data"] = []

    db_json[args['database']]["data"].append(args['uuid'])

    # ---

    sys.stdout.write(
        json.dumps(db_json, separators=(",", ":"))
    )