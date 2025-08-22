#! /bin/bash

UUID=$1

if [[ $IS_REQ = true ]]; then
    UUID=$(jq -r '.uuid' $REQ)
fi

# get parent
PARENT=$(
    jq -r --arg uuid "$UUID" \
    '.[$uuid].parent' \
    /mnt/storage/conf/database.json
)

# create tmp
mkdir -p /tmp/server/database
cat /mnt/storage/conf/database.json > /tmp/server/database/mod

# ---

# remove item
jq --arg uuid "$UUID" \
    'del(.[$uuid])' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# remove referencia
jq --arg parent "$PARENT" --arg uuid "$UUID" \
    '.[$parent].data |= map(select(. != $uuid))' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# ---

# salve conf.json
cat /tmp/server/database/mod > /mnt/storage/conf/database.json
rm -rf /tmp/server/database