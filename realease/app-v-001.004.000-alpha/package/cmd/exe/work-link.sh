#! /bin/bash

UUID="$(jq -r '.uuid' /tmp/share/data/$SESSION/data.json)"
NAME="$(jq -r '.name' /tmp/share/data/$SESSION/data.json)"

FILE=$(_python $DIR_CMD/lib/work-link.py)
echo "$FILE" > /mnt/storage/conf/work.json

mkdir -p /mnt/storage/data/$UUID
ln -sf $STORAGE/data/$UUID /mnt/vault/work/$NAME