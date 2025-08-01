#! /bin/bash

[[ -f /mnt/vault/ini-$VERSION ]] || /usr/local/bin/obsidian-cli ini

/usr/bin/env python3 /usr/local/src/obsidian/cmd/server.py
