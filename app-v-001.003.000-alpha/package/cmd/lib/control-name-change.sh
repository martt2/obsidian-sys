#! /bin/bash

UUID=$1
NEW_NAME=$2

if [[ $IS_REQ = true ]]; then
    UUID=$(jq -r '.uuid' $REQ)
    TYPE=$(jq -r '.type' $REQ)
    NEW_NAME=$(jq -r '.new_name' $REQ)
fi

if [[ $TYPE == "database" ]]; then
    /bin/bash $DIR_CMD/lib/conf-name-change.sh $UUID $NEW_NAME
fi

