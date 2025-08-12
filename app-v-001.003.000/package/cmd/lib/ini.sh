#! /bin/bash

echo 'ini'

PKG=/usr/local/src/obsidian/package

# ---
# vault
# ---

# create directories
mkdir -p /mnt/vault/.obsidian
mkdir -p /mnt/vault/.obsidian/snippets
mkdir -p /mnt/vault/page
mkdir -p /mnt/vault/sys/css
mkdir -p /mnt/vault/sys/js
mkdir -p /mnt/vault/sys/model
mkdir -p /mnt/vault/work

# create pages
cp -f $PKG/model/md/page-main.md /mnt/vault/main.md
cp -f $PKG/model/md/page-conf.md /mnt/vault/page/conf.md
cp -f $PKG/model/md/page-add.md  /mnt/vault/page/add.md

# create css and js
cp -f $PKG/model/css/main.css /mnt/vault/sys/css/main.css
cp -f $PKG/model/js/main.js   /mnt/vault/sys/js/main.js

# create models
cp -f $PKG/model/md/btn-add.md    /mnt/vault/sys/model/btn-add.md
cp -f $PKG/model/md/btn-reload.md /mnt/vault/sys/model/btn-reload.md
cp -f $PKG/model/md/btn-remove.md /mnt/vault/sys/model/btn-remove.md
cp -f $PKG/model/md/btn-link.md   /mnt/vault/sys/model/btn-link.md
cp -f $PKG/model/md/btn-unlink.md /mnt/vault/sys/model/btn-unlink.md

# configure obsidian
cp -f  $PKG/model/obsidian/* /mnt/vault/.obsidian
cp -rf $PKG/plugins          /mnt/vault/.obsidian/plugins

# create link
ln -sf $STORAGE/view           /mnt/vault/view
ln -sf $STORAGE/conf           /mnt/vault/sys/conf
ln -sf $VAULT/sys/css/main.css /mnt/vault/.obsidian/snippets/main.css

# ---

# ---
# storage
# ---

# create directories
mkdir -p /mnt/storage/trash
mkdir -p /mnt/storage/data
mkdir -p /mnt/storage/view
mkdir -p /mnt/storage/conf
mkdir -p /mnt/storage/custom/js
mkdir -p /mnt/storage/custom/css
mkdir -p /mnt/storage/custom/cmd
mkdir -p /mnt/storage/lib-run

# create conf
[[ -f /mnt/storage/conf/conf.json ]] || \
    cp -f $PKG/model/json/conf.json /mnt/storage/conf/conf.json
[[ -f /mnt/storage/conf/work.json ]] || \
    cp -f $PKG/model/json/work.json /mnt/storage/conf/work.json

# create view
if ! [[ -d /mnt/storage/view/main ]]; then
    mkdir -p /mnt/storage/view/main/data
    cp -f $PKG/model/md/database.md /mnt/storage/view/main/main.md
fi

# ---

# create ini
touch /mnt/vault/ini