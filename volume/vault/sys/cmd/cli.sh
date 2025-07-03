#! /bin/bash

VAULT=/usr/local/src/vault
STORAGE=/usr/local/src/storage

ENV="VAULT=$VAULT STORAGE=$STORAGE"
CMD=$VAULT/sys/cmd/lib/$1.sh

shift 1

if ! [ -f $CMD ]; then
  echo 'command not found'
fi

env $ENV $CMD $@