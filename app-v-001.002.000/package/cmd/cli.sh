#! /bin/bash

#source /usr/local/etc/obsidian/env

#ENV="$(cat /usr/local/etc/obsidian/env | xargs)"
CMD=/usr/local/src/obsidian/cmd/lib/$1.sh

shift 1

if ! [ -f $CMD ]; then
    echo 'command not found'
    exit
fi

# args=()
# for arg in "$@"; do
#     cleaned="${arg//\\}"
#     args+=("$cleaned")
# done

export REQ=/tmp/server/data/$CLIENT_ID.json
export IS_REQ=$([[ -f "$REQ" && -n "$CLIENT_ID" ]] && echo true || echo false)

# /bin/bash $CMD ${args[@]}
/bin/bash $CMD $@

# [[ -f  /tmp/server/data/$CLIENT_ID.json ]] && rm -rf /tmp/server/data/$CLIENT_ID.json