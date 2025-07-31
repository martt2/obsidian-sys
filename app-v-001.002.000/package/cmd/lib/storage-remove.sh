#! /bin/bash

UUID=$1

if [[ $IS_REQ ]]; then
    UUID=$(jq -r '.uuid' $REQ)
fi

mkdir -p /mnt/storage/.trash/data
mkdir -p /mnt/storage/.trash/view/data
mv /mnt/storage/data/$UUID /mnt/storage/.trash/data/$UUID
mv /mnt/storage/view/data/$UUID.md /mnt/storage/.trash/view/data/$UUID.md