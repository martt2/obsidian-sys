#! /bin/bash

DIR_PKG=/usr/local/src/obsidian/package

if ! [[ -f /mnt/vault/.ini ]]; then
    echo "ini vault";
    _bash $DIR_CMD/lib/pass-arg.sh target=vault;
    _bash $DIR_CMD/lib/ini-make.sh;

    # obsidian
    cp -rf $DIR_PKG/ini/data-obsidian /mnt/vault/.obsidian;
    ln -sf "$VAULT/sys/css" "/mnt/vault/.obsidian/snippets";

    touch /mnt/vault/.ini;
fi

if ! [[ -f /mnt/storage/.ini ]]; then
    echo "ini storage";
    _bash $DIR_CMD/lib/pass-arg.sh target=storage;
    _bash $DIR_CMD/lib/ini-make.sh;
    touch /mnt/storage/.ini;
fi
