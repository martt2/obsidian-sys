#! /bin/bash

DIR_PKG=/usr/local/src/obsidian/package

TARGET="$1"
_PATH="/mnt/$TARGET/${2:""}"

# create directories
while IFS= read -r I; do
    if [[ -n $I ]]; then
        echo "create dir $I";
        mkdir -p "$I";
    fi
done <<< "$( grep "^$_PATH" $DIR_PKG/ini/dir-$TARGET )";

echo "$_PATH"

# create pages
while IFS= read -r I; do
    IFS=" ";
    read -r -a FILE <<< "$I";
    if [[ -n $FILE ]]; then
        echo "copy file ${FILE[0]}";
        cp -f "$DIR_PKG/ini/data/${FILE[1]}" "${FILE[0]}";
    fi
done <<< "$( grep "^$_PATH" $DIR_PKG/ini/files-$TARGET )";

# create links
while IFS= read -r I; do
    IFS=" ";
    read -r -a FILE <<< "$I";
    if [[ -n $FILE ]]; then
        echo "create link ${FILE[0]}";
        ln -sf "$STORAGE/${FILE[1]}" "${FILE[0]}";
    fi
done <<< "$( grep "^$_PATH" $DIR_PKG/ini/links-$TARGET )";