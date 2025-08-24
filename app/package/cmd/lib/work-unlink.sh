#! /bin/bash

UUID=$1

if [[ $IS_REQ ]]; then
    UUID=$(jq -r '.uuid' $REQ)
fi

NAME=$(
    jq -r --arg uuid "$UUID" \
    '.[$uuid]' \
    /mnt/storage/conf/work.json
)

# create tmp
mkdir -p /tmp/server/work
cat /mnt/storage/conf/work.json > /tmp/server/work/mod

# ---

# remove work alias
jq --arg name "$NAME" --arg uuid "$UUID" \
    'del(.[$uuid])' \
    /tmp/server/work/mod > /tmp/server/work/_mod
cat /tmp/server/work/_mod > /tmp/server/work/mod

# ---

# salve work.json
cat /tmp/server/work/mod > /mnt/storage/conf/work.json
rm -rf /tmp/server/work

rm /mnt/vault/work/$NAME