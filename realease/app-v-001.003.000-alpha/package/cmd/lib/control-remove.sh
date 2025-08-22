#! /bin/bash

UUID=$1
TYPE=$2
DATABASE=$3

if [[ $IS_REQ = true ]]; then
    UUID=$(jq -r '.uuid' $REQ)
    TYPE=$(jq -r '.type' $REQ)
    DATABASE=$(jq -r '.database' $REQ)
fi

# criar trash
mkdir -p /mnt/storage/.trash/data
mkdir -p /mnt/storage/.trash/control
mkdir -p /mnt/storage/.trash/info

# remover o controle
mv /mnt/storage/view/$DATABASE/data/$UUID.md /mnt/storage/.trash/control/$UUID.md

# remover o storage
[[ -d /mnt/storage/data/$UUID ]] && \
     mv /mnt/storage/data/$UUID /mnt/storage/.trash/data/$UUID

if [[ $TYPE == "database" ]]; then
    # remove o database do conf
    /bin/bash $DIR_CMD/lib/conf-db-remove.sh $UUID

    # remover view
    mv /mnt/storage/view/$UUID /mnt/storage/.trash/data/$UUID
fi
