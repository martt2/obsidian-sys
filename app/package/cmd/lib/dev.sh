#! /bin/bash

TARGET="$1"
_PATH="/mnt/$TARGET/${2:""}"
DIR_PKG="/usr/local/src/obsidian/package"

if [[ $TARGET == "obsidian" ]]; then
    mkdir -p /mnt/export/data-$TARGET
    cp -rf /mnt/vault/.obsidian/plugins /mnt/export/data-$TARGET/plugins
    cp -rf /mnt/vault/.obsidian/appearance.json /mnt/export/data-$TARGET
    cp -rf /mnt/vault/.obsidian/app.json /mnt/export/data-$TARGET
    cp -rf /mnt/vault/.obsidian/community-plugins.json /mnt/export/data-$TARGET
    exit
fi

FILES=$(find "$_PATH" -path '*/.*' -prune -o -type f -print)
DIR=$(find "$_PATH" -path '*/.*' -prune -o -type d -print)
LINKS=$(find "$_PATH" -path '*/.*' -prune -o -type l -print)

F_FILE=""
F_DIR=""
F_LINK=""

[[ -f /mnt/export/files-$TARGET ]] && F_FILE="$( cat /mnt/export/files-$TARGET )"
[[ -f /mnt/export/dir-$TARGET   ]] && F_DIR="$(  cat /mnt/export/dir-$TARGET   )"
[[ -f /mnt/export/links-$TARGET ]] && F_LINK="$( cat /mnt/export/links-$TARGET )"

mkdir -p /mnt/export/data

# directory

echo "directory:"
diff -u <(echo "$F_DIR") <(echo "$DIR") | grep '^[+-]' | grep -v '---'
echo ""
F_DIR="$( echo "$F_DIR\n$DIR" | sort -u)"

# file
while IFS= read -r I; do

    if [[ -n "$I" ]]; then
        continue
    fi

    LINE="$( echo "$F_FILE" | grep "^$I" )"
    if [[ "$LINE" != "" ]]; then
        UUID="$( echo "$LINE" | cut -d' ' -f2 )"
    else
        UUID="$( uuidgen )"
        F_FILE+="\n$I $UUID"
    fi

    echo -e "$( cat "$I" )" > "/mnt/export/data/$UUID"
    echo "add file $I"
done <<< "$FILES"

# link
while IFS= read -r I; do

    if [[ -n "$I" ]]; then
        continue
    fi

    LINK_TARGET="${$(readlink "$I")#"$STORAGE"}"

    LINE="$( echo "$F_LINK" | grep "^$I" )"
    if [[ "$LINE" != "" ]]; then
        F_LINK="$(echo "$F_LINK" | sed "s|^$I|$I $LINK_TARGET|g")"
    else
        F_LINK+="$I $LINK_TARGET"
    fi

        echo "link $I $LINK_TARGET"
done <<< "$LINKS"

echo -e "$F_FILE" | sed '/^$/d' > /mnt/export/files-$TARGET
echo -e "$F_DIR" | sed '/^$/d' > /mnt/export/dir-$TARGET
echo -e "$F_LINK" | sed '/^$/d' > /mnt/export/links-$TARGET