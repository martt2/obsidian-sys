#! /bin/bash

CMD=/usr/local/src/obsidian/cmd/lib/$1.sh

shift 1

if ! [ -f $CMD ]; then
    echo 'command not found'
    exit
fi

export REQ=/tmp/server/data/$CLIENT_ID.json
export IS_REQ=$([[ -f "$REQ" && -n "$CLIENT_ID" ]] && echo true || echo false)

/bin/bash $CMD $@