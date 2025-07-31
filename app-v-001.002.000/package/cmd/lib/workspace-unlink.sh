#! /bin/bash

UUID=$1

if [[ $IS_REQ ]]; then
    UUID=$(jq -r '.uuid' $REQ)
fi

rm /mnt/vault/$VERSION/work/$UUID