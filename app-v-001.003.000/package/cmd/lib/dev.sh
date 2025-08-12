#! /bin/bash

FILES=$(find /mnt/vault -path '*/.*' -prune -o -type f -print)
DIR=$(find /mnt/vault -path '*/.*' -prune -o -type d -print)
LINKS=$(find /mnt/vault -path '*/.*' -prune -o -type l -print)
FILES_VALUE=""
LINKS_VALUE=""

mkdir -p /mnt/vault/export/data

while IFS= read -r I; do
    UUID=$(uuidgen)
    cp -f "$I" "/mnt/vault/export/data/$UUID"
    FILES_VALUE+="\n\"./$UUID\" \"$I\""
done <<< "$FILES"

while IFS= read -r I; do
    TARGET=$(readlink $I)
    LINKS_VALUE+="\n\"$TARGET\" \"$I\""
done <<< "$LINKS"

echo -e "$FILES_VALUE" | sed '/^$/d' > /mnt/vault/export/files
echo -e "$DIR" | sed '/^$/d' > /mnt/vault/export/dir
echo -e "$LINKS_VALUE" | sed '/^$/d' > /mnt/vault/export/links