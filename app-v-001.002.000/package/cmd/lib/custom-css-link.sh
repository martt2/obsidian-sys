#! /bin/bash

NAME=$1

if [[ $IS_REQ ]]; then
    NAME=$(jq -r '.name' $REQ)
fi

ln -s /mnt/storage/custom/css/$NAME.css /mnt/vault/$VERSION/.obsidian/snippets/custom-$NAME.css