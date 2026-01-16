#! /bin/bash

UUID="$(jq -r '.uuid' /tmp/share/data/$SESSION/data.json)"
NAME="$(
    jq -r --arg uuid "$UUID" \
    '.[$uuid]' \
    /mnt/storage/conf/work.json
)"

FILE=$(_python $DIR_CMD/lib/work-unlink.py)
echo "$FILE" > /mnt/storage/conf/work.json

rm /mnt/vault/work/$NAME