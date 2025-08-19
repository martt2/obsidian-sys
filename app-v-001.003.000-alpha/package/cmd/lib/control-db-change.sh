#! /bin/bash

UUID=$1
TYPE=$2
DATABASE=$3
NEW_DATABASE=$4

if [[ $IS_REQ ]]; then
    UUID=$(jq -r '.uuid' $REQ)
    TYPE=$(jq -r '.type' $REQ)
    DATABASE=$(jq -r '.database' $REQ)
    NEW_DATABASE=$(jq -r '.new_database' $REQ)
fi

# move control
mv  /mnt/storage/view/$DATABASE/data/$UUID.md \
    /mnt/storage/view/$NEW_DATABASE/data/$UUID.md

if [[ $TYPE == "database" ]]; then
    # change o database do conf
    /bin/bash $DIR_CMD/lib/conf-db-change.sh $UUID $NEW_DATABASE
fi