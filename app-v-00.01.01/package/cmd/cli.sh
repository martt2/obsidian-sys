#! /bin/bash

#source /usr/local/etc/obsidian/env

#ENV="$(cat /usr/local/etc/obsidian/env | xargs)"
CMD=/usr/local/src/obsidian/cmd/lib/$1.sh

shift 1

if ! [ -f $CMD ]; then
  echo 'command not found'
  exit
fi

args=()
for arg in "$@"; do
    cleaned="${arg//\\}"
    args+=("$cleaned")
done

/bin/bash $CMD ${args[@]}