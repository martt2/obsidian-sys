#! /bin/bash

export DIR_PKG=/usr/local/src/obsidian/package

if ! [[ -f /mnt/vault/.ini ]]; then
    echo "ini vault";
    /bin/bash $DIR_CMD/lib/ini-make.sh vault;

    # obsidian
    cp -rf $DIR_PKG/ini/data-obsidian /mnt/vault/.obsidian;
    ln -sf "$VAULT/sys/css" "/mnt/vault/.obsidian/snippets";

    touch /mnt/vault/.ini;
fi

if ! [[ -f /mnt/storage/.ini ]]; then
    echo "ini storage";
    /bin/bash $DIR_CMD/lib/ini-make.sh storage;
    touch /mnt/storage/.ini;
fi
