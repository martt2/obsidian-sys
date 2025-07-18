#! /bin/bash

source $HOME/.obsidian-cli/env

[[ -f $VAULT/sys/ini ]] || /usr/local/bin/obsidian-cli ini

/usr/bin/obsidian --no-sandbox
