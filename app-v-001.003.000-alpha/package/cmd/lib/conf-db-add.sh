#! /bin/bash

UUID=$1
DATABASE=$2
NAME=$3

if [[ $IS_REQ = true ]]; then
    echo $IS_REQ
    echo "ops, passei onde não era pra passar..."
    DATABASE=$(jq -r '.database' $REQ)
    NAME=$(jq -r '.name' $REQ)
fi

JSON=$( cat <<-EOF

{
    "id": "$UUID",
    "name": "$NAME",
    "parent": "$DATABASE",
    "data": []
}

EOF

)

# minificar
JSON=$( echo $JSON | jq -c '.' )

# create tmp
mkdir -p /tmp/server/database
cat /mnt/storage/conf/database.json > /tmp/server/database/mod

# ---

# add item
jq --arg uuid "$UUID" --argjson json "$JSON" \
    '.[$uuid] += $json' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# add referencia
jq --arg database "$DATABASE" --arg uuid "$UUID" \
    '.[$database].data += [$uuid]' \
    /tmp/server/database/mod > /tmp/server/database/_mod
cat /tmp/server/database/_mod > /tmp/server/database/mod

# ---

# salve conf.json
cat /tmp/server/database/mod > /mnt/storage/conf/database.json
rm -rf /tmp/server/database