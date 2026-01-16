#! /bin/bash

UUID=$(jq -r '.uuid' /tmp/share/data/$SESSION/data.json)
TYPE=$(jq -r '.type' /tmp/share/data/$SESSION/data.json)
DATABASE=$(jq -r '.database' /tmp/share/data/$SESSION/data.json)
NEW_DATABASE=$(jq -r '.new_database' /tmp/share/data/$SESSION/data.json)

# move control
mv /mnt/storage/database/data/$TYPE/$DATABASE/$UUID.md \
    /mnt/storage/database/data/$TYPE/$NEW_DATABASE/$UUID.md

if [[ $TYPE == "database" ]]; then
    # change parent
    FILE=$(_python $DIR_CMD/lib/db-change-parent.py)
    echo "$FILE" > /mnt/storage/conf/database.json
fi