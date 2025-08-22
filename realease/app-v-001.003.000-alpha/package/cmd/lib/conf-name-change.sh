#! /bin/bash

UUID=$1
NEW_NAME=$2

if [[ $IS_REQ = true ]]; then
    UUID=$(jq -r '.uuid' $REQ)
    NEW_NAME=$(jq -r '.new_name' $REQ)
fi

# create tmp
mkdir -p /tmp/server/database
cat /mnt/storage/conf/databse.json > /tmp/server/database/mod

# ---

# change name
jq --arg new_name "$NEW_NAME" --arg uuid "$UUID" \
    '.[$uuid].name = $new_name' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# ---

# salve conf.json
cat /tmp/server/database/mod > /mnt/storage/conf/databse.json
rm -rf /tmp/server/database