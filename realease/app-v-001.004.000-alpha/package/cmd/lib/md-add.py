#! /usr/bin/env python3

import argparse
import sys
import os
import json

if __name__ == "__main__":
    session = os.environ.get("SESSION")
    args = json.load(open(f"/tmp/share/data/{session}/data.json", "r"))

    #---

    # create tags
    tags = "\n".join([f"  - {t}" for t in args['tag']]) if args['tag'] else ""

    yaml = '\n'.join((
        f"sys_id: {args['uuid']}",
        f"sys_database: {args['database']}",
        f"sys_user: {args['user']}",
        f"sys_name: {args['name']}",
        f"sys_rule: {args['rule']}",
        f"sys_type: {args['type']}",
        f"sys_actived: null",
        f"sys_archived: false",
        f"tags: \n{tags}"
    ))

    # clear lines
    yaml = "\n".join([line for line in yaml.splitlines() if line.strip()])

    content = '\n'.join((
        "---",
        yaml,
        "---"
    ))

    content = content.strip()
    sys.stdout.write(content)
