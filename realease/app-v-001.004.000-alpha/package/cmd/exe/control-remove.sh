#! /bin/bash

UUID=$(jq -r '.uuid' /tmp/share/data/$SESSION/data.json)
TYPE=$(jq -r '.type' /tmp/share/data/$SESSION/data.json)
DATABASE=$(jq -r '.database' /tmp/share/data/$SESSION/data.json)

# criar trash
mkdir -p /mnt/storage/.trash/database/view
mkdir -p /mnt/storage/.trash/database/data/item
mkdir -p /mnt/storage/.trash/database/data/database
mkdir -p /mnt/storage/.trash/control
mkdir -p /mnt/storage/.trash/info

# remover o controle
mv /mnt/storage/database/data/$TYPE/$DATABASE/$UUID.md \
    /mnt/storage/.trash/control/$UUID.md

# remover o storage
[[ -d /mnt/storage/data/$UUID ]] && \
     mv /mnt/storage/data/$UUID /mnt/storage/.trash/data/$UUID

if [[ $TYPE == "database" ]]; then
    # remove o database do conf
    FILE=$(_python $DIR_CMD/lib/conf-db-remove.py)
    echo "$FILE" > /mnt/storage/conf/database.json

    # remover view
    mv /mnt/storage/database/view/$UUID.base \
        /mnt/storage/.trash/database/view/$UUID.base
    
    # remover data
    mv /mnt/storage/database/data/item/$UUID \
        /mnt/storage/.trash/database/data/item/$UUID
    mv /mnt/storage/database/data/database/$UUID \
        /mnt/storage/.trash/database/data/database/$UUID
fi
