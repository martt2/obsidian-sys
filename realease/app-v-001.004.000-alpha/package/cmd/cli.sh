#! /bin/bash

set -euo pipefail

export DIR_CMD="/usr/local/src/obsidian/cmd"
cd "$DIR_CMD"

#---
# debug
#---
if [[ ${DEBUG:-false} == true ]]; then
    eval "set -- $1"
    _bash() { c="$1"; shift 1; ( source "$c" "$@"; ) }
    # _bash() { /usr/bin/bashdb --tty "$TTY" "$@" < /dev/null; }
    _python() { /usr/bin/python3 -m debugpy --listen 5678 --wait-for-client "$@"; }
else
    _bash() { /bin/bash "$@"; }
    _python() { /usr/bin/python3 "$@"; }
fi

export -f _bash
export -f _python

#---

#---
# cmd
#---

CMD="$1";

if [[ $CMD == "" ]]; then
    echo "command not defined" >&2;
    exit 1;
fi

shift 1;

if [[ $CMD == "sys" ]]; then
    shift 1;
    CMD="$1";

    if [[ $CMD == "" ]]; then
        echo "command not defined" >&2;
        exit 1;
    fi

    shift 1;

    if [[ -f $DIR_CMD/lib/$CMD.sh  ]]; then
        CMD=$DIR_CMD/lib/$CMD.sh;
    else
        echo "command $CMD not found" >&2;
        exit 1;
    fi

elif [[ -f /mnt/storage/.cdm-run/$CMD.sh  ]]; then
    CMD=/mnt/storage/.cdm-run/$CMD.sh;

elif [[ -f $DIR_CMD/exe/$CMD.sh  ]]; then
    CMD=$DIR_CMD/exe/$CMD.sh;

else
    echo "command $CMD not found" >&2;
    exit 1;
fi

#---

#---
# session
#---

export SESSION="${SESSION:-"session_$(uuidgen)"}"

# if [[ -n "${CLIENT_ID:-}" ]]; then
#     export SESSION="session_$CLIENT_ID";
# else
#     export SESSION="session_$(uuidgen)";
# fi

mkdir -p /tmp/share/data/$SESSION;

#---

#---
# data.json
#---

if ! [[ -f /tmp/share/data/$SESSION/data.json ]]; then
   echo "{}" > /tmp/share/data/$SESSION/data.json;
fi

_bash $DIR_CMD/lib/pass-arg.sh $@;

#---

_bash $CMD;

[[ -d  /tmp/share/data/$SESSION ]] && rm -rf /tmp/share/data/$SESSION;