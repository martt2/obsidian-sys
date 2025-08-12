#! /bin/bash

UUID=$1
DATABASE=$2
NAME=$3

if [[ $IS_REQ ]]; then
    DATABASE=$(jq -r '.database' $REQ)
    NAME=$(jq -r '.name' $REQ)
fi

JSON=$( cat <<-EOF

{
    "id": "$UUID",
    "name": "$NAME",
    "data": []
}

EOF

)

# jq '.database.bd3 += {"name":"bd3","data":[]}' ./conf/conf2.json
# jq "(.database.bd2.data) += [1]" ./conf/conf2.json

# minificar
JSON=$( echo $JSON | jq -c '.' )

# criar tmp
mkdir -p /tmp/server/conf
cat /mnt/storage/conf/conf.json > /tmp/server/conf/mod

# adiciona o item ao conf database
# jq ".database += [$JSON]" /tmp/server/conf/mod > /tmp/server/conf/_mod
#jq ".database.$UUID += $JSON" /tmp/server/conf/mod > /tmp/server/conf/_mod
jq --arg uuid "$UUID" --argjson json "$JSON" \
    '.database[$uuid] += $json' \
    /tmp/server/conf/mod > /tmp/server/conf/_mod
cat /tmp/server/conf/_mod > /tmp/server/conf/mod

# adiciona ao database o uuid de referencia
# jq "(.database[] | select(.id == \"$DATABASE\") | .data) += [\"$UUID\"]" /tmp/server/conf/mod > /tmp/server/conf/_mod
#jq ".database.$DATABASE.data += [$UUID]" /tmp/server/conf/mod > /tmp/server/conf/_mod
jq --arg database "$DATABASE" --arg uuid "$UUID" \
    '.database[$database].data += [$uuid]' \
    /tmp/server/conf/mod > /tmp/server/conf/_mod
cat /tmp/server/conf/_mod > /tmp/server/conf/mod

# salvar conf.json
cat /tmp/server/conf/mod > /mnt/storage/conf/conf.json
rm -rf /tmp/server/conf

# cria a view
mkdir -p /mnt/storage/view/$UUID/data
cat /mnt/vault/sys/model/database.md > /mnt/storage/view/$UUID/main.md