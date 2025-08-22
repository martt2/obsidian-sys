#! /bin/bash

TARGET=$1

# create directories
while IFS= read -r I; do
    if [[ -n $I ]]; then
        echo "create dir $I";
        mkdir -p "$I";
    fi
done <<< "$( cat $DIR_PKG/ini/dir-$TARGET )";

# create pages
while IFS= read -r I; do
    IFS=" ";
    read -r -a FILE <<< "$I";
    if [[ -n $FILE ]]; then
        echo "copy file ${FILE[1]}";
        cp -f "$DIR_PKG/ini/data/${FILE[0]}" "${FILE[1]}";
    fi
done <<< "$( cat $DIR_PKG/ini/files-$TARGET )";

# create links
while IFS= read -r I; do
    IFS=" ";
    read -r -a FILE <<< "$I";
    if [[ -n $FILE ]]; then
        echo "create link ${FILE[1]}";
        ln -sf "$STORAGE/${FILE[0]}" "${FILE[1]}";
    fi
done <<< "$( cat $DIR_PKG/ini/links-$TARGET )";