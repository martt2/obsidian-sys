#! /bin/bash

UUID=$1
mkdir -p $STORAGE/.trash/data
mkdir -p $STORAGE/.trash/view/data
mv $STORAGE/data/$UUID $STORAGE/.trash/data/$UUID
mv $STORAGE/view/data/$UUID.md $STORAGE/.trash/view/data/$UUID.md