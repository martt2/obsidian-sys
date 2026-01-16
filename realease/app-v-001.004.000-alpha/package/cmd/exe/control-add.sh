#! /bin/bash

UUID=$(uuidgen)
_bash $DIR_CMD/lib/pass-arg.sh uuid=$UUID;
DATABASE=$(jq -r '.database' /tmp/share/data/$SESSION/data.json)
TYPE=$(jq -r '.type' /tmp/share/data/$SESSION/data.json)

# create control
FILE=$(_python $DIR_CMD/lib/md-add.py)
mkdir -p /mnt/storage/database/data/$TYPE/$DATABASE/
echo -e "$FILE" > /mnt/storage/database/data/$TYPE/$DATABASE/$UUID.md

if [[ $TYPE == "database" ]]; then
    # add database in conf
    FILE=$(_python $DIR_CMD/lib/conf-db-add.py)
    echo "$FILE" > /mnt/storage/conf/database.json

    # create view
    mkdir -p /mnt/storage/database/data/item/$UUID
    mkdir -p /mnt/storage/database/data/database/$UUID
    cat /mnt/vault/sys/model/database.base > \
        /mnt/storage/database/view/$UUID.base
fi