#! /bin/bash

UUID=$1

if [[ $IS_REQ ]]; then
    UUID=$(jq -r '.uuid' $REQ)
fi

ln -sf $STORAGE/data/$UUID /mnt/vault/$VERSION/work/$UUID