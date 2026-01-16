#! /usr/bin/env python3

import sys
import subprocess
import debugpy
import shlex
import os

debugpy.listen(("0.0.0.0", 5678))
print("wait debug...")
debugpy.wait_for_client()
print("debug on")

result = subprocess.run(
    [ 'bashdb', '/usr/local/src/obsidian/cmd/test.sh', *sys.argv ],
    capture_output=True,
    text=True
)

print(result.stdout)
print(result.stderr)