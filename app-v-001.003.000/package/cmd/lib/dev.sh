#! /bin/bash

TARGET=$1
DIR_PKG="/usr/local/src/obsidian/package"

if [[ $TARGET == "obsidian" ]]; then
    mkdir -p /mnt/vault/export/data-$TARGET
    cp -rf /mnt/vault/.obsidian/plugins /mnt/vault/export/data-$TARGET/plugins
    cp -rf /mnt/vault/.obsidian/appearance.json /mnt/vault/export/data-$TARGET
    cp -rf /mnt/vault/.obsidian/app.json /mnt/vault/export/data-$TARGET
    cp -rf /mnt/vault/.obsidian/community-plugins.json /mnt/vault/export/data-$TARGET
    exit
fi

FILES=$(find /mnt/$TARGET -path '*/.*' -prune -o -type f -print)
DIR=$(find /mnt/$TARGET -path '*/.*' -prune -o -type d -print)
LINKS=$(find /mnt/$TARGET -path '*/.*' -prune -o -type l -print)
FILES_VALUE=""
LINKS_VALUE=""

mkdir -p /mnt/vault/export/data

while IFS= read -r I; do
    UUID=$(uuidgen)
    cp -f "$I" "/mnt/vault/export/data/$UUID"
    FILES_VALUE+="\n$UUID $I"
done <<< "$FILES"

while IFS= read -r I; do
    LINK_TARGET=$(readlink $I)
    LINKS_VALUE+="\n$LINK_TARGET $I"
done <<< "$LINKS"

echo -e "$FILES_VALUE" | sed '/^$/d' > /mnt/vault/export/files-$TARGET
echo -e "$DIR" | sed '/^$/d' > /mnt/vault/export/dir-$TARGET
echo -e "$LINKS_VALUE" | sed '/^$/d' > /mnt/vault/export/links-$TARGET