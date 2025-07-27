#! /bin/bash

UUID=$1
mkdir -p /mnt/storage/.trash/data
mkdir -p /mnt/storage/.trash/view/data
mv /mnt/storage/data/$UUID /mnt/storage/.trash/data/$UUID
mv /mnt/storage/view/data/$UUID.md /mnt/storage/.trash/view/data/$UUID.md