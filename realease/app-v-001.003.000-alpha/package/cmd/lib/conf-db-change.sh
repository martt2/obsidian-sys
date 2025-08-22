#! /bin/bash

UUID=$1
NEW_DATABASE=$2

if [[ $IS_REQ = true ]]; then
    UUID=$(jq -r '.uuid' $REQ)
    NEW_DATABASE=$(jq -r '.new_database' $REQ)
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

# remove referencia parent
jq --arg parent "$PARENT" --arg uuid "$UUID" \
    '.[$parent].data |= map(select(. != $uuid))' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# add referencia database
jq --arg new_database "$NEW_DATABASE" --arg uuid "$UUID" \
    '.[$new_database].data += [$uuid]' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# change parent
jq --arg new_database "$NEW_DATABASE" --arg uuid "$UUID" \
    '.[$uuid].parent = $new_database' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# ---

# salve conf.json
cat /tmp/server/database/mod > /mnt/storage/conf/database.json
rm -rf /tmp/server/database