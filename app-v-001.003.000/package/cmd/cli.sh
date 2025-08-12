#! /bin/bash

# export DIR_CMD="$(realpath $(dirname "$0"))"
# cd $DIR_CMD

export DIR_CMD="/usr/local/src/obsidian/cmd"
cd $DIR_CMD

CMD=$DIR_CMD/lib/$1.sh
CMD=$1

[[ $CMD == "" ]] && echo 'command not defined'

shift 1

if [[ -f /mnt/storage/lib-run/$CMD.sh  ]]; then
    CMD=/mnt/storage/lib-run/$CMD.sh

elif [[ -f $DIR_CMD/lib/$CMD.sh  ]]; then
    CMD=$DIR_CMD/lib/$CMD.sh

else
    echo 'command not found'
    exit
fi

if [[ $CLIENT_ID != "" ]]; then
    export REQ=/tmp/server/data/$CLIENT_ID.json
    export IS_REQ=$([[ -f "$REQ" && -n "$CLIENT_ID" ]] && echo true || echo false)  
else
    export REQ=""
    export IS_REQ=$(false)
fi

/bin/bash $CMD $@

[[ -f  /tmp/server/data/$CLIENT_ID.json ]] && rm -rf /tmp/server/data/$CLIENT_ID.json