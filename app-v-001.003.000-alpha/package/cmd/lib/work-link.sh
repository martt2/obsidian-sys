#! /bin/bash

UUID=$1
NAME=$2

if [[ $IS_REQ ]]; then
    UUID=$(jq -r '.uuid' $REQ)
    NAME=$(jq -r '.name' $REQ)
fi

# create tmp
mkdir -p /tmp/server/work
cat /mnt/storage/conf/work.json > /tmp/server/work/mod

# ---

# add work alias
jq --arg name "$NAME" --arg uuid "$UUID" \
    '.[$uuid] = $name' \
    /tmp/server/work/mod > /tmp/server/work/_mod
cat /tmp/server/work/_mod > /tmp/server/work/mod

# ---

# salve work.json
cat /tmp/server/work/mod > /mnt/storage/conf/work.json
rm -rf /tmp/server/work

mkdir -p /mnt/storage/data/$UUID
ln -sf $STORAGE/data/$UUID /mnt/vault/work/$NAME