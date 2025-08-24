#! /bin/bash

NAME=$1

if [[ $IS_REQ ]]; then
    NAME=$(jq -r '.name' $REQ)
fi

rm /mnt/vault/$VERSION/.obsidian/snippets/custom-$NAME.css