#! /bin/bash

FILE=$(_python $DIR_CMD/lib/db-change-name.py)
echo "$FILE" > /mnt/storage/conf/database.json