#! /usr/bin/env python3

import argparse
import sys
import os
import json

db_file = "/mnt/storage/conf/work.json"

if __name__ == "__main__":
    session = os.environ.get("SESSION")
    args = json.load(open(f"/tmp/share/data/{session}/data.json", "r"))

    #---

    os.makedirs(os.path.dirname(db_file), exist_ok=True)

    db_json = {}
    if os.path.exists(db_file):
        db_json = json.load(open(db_file, "r"))

    uuid = args["uuid"]
    if not uuid in db_json:
        sys.stderr.write(f"work link {uuid} not exist")
        exit

    # ---

    db_json.pop(uuid, None)

    # ---

    sys.stdout.write(
        json.dumps(db_json, separators=(",", ":"))
    )