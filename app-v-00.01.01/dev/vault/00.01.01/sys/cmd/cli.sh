#! /bin/bash

source $HOME/.obsidian-cli/env

ENV="$(cat $HOME/.obsidian-cli/env | xargs)"
CMD=$VAULT/sys/cmd/lib/$1.sh

shift 1

if ! [ -f $CMD ]; then
  echo 'command not found'
fi

args=()
for arg in "$@"; do
    cleaned="${arg//\\}"
    args+=("$cleaned")
done

env $ENV $CMD ${args[@]}