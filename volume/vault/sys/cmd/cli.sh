#! /bin/bash

source $HOME/.obsidian-cli/env

# VAULT=/usr/local/src/vault
# STORAGE=/usr/local/src/storage

# ENV="VAULT=$VAULT STORAGE=$STORAGE"
ENV="$(cat $HOME/.obsidian-cli/env | xargs)"
CMD=$VAULT/sys/cmd/lib/$1.sh

shift 1

if ! [ -f $CMD ]; then
  echo 'command not found'
fi

env $ENV $CMD $@