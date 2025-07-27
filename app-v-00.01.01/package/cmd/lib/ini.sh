#! /bin/bash

# VERSION=${VERSION:-'00.01.01'}

CONF=$(cat <<-EOF

# Conf
---

**user:** \`INPUT[text(placeholder(user)):user]\`

\`BUTTON[btn-reload]\`

\`\`\`meta-bind-button
label: reload
icon: ""
style: primary
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-reload
hidden: true
actions:
  - type: inlineJS
    code: |-
      const {main} = await cJS()
      main.loadConf()
    args: {}

\`\`\`

\`\`\`meta-bind-embed
[[sys/model/meta-bind-embed/btn-goto]]
\`\`\`

EOF

)

if ! [[ -d /mnt/vault/$VERSION ]]; then
    unzip /usr/local/src/obsidian/pkg/vault/$VERSION.zip -d /mnt/vault/$VERSION
    mv /mnt/vault/$VERSION/obsidian /mnt/vault/$VERSION/.obsidian;
fi

mkdir -p /mnt/storage/data/
mkdir -p /mnt/storage/view/data/
mkdir -p /mnt/storage/custom/js
mkdir -p /mnt/storage/custom/css
mkdir -p /mnt/storage/custom/cmd
[[ -f /mnt/storage/conf.md ]] || echo -e "$CONF" > /mnt/storage/conf.md

ln -sf /mnt/storage/conf.md /mnt/vault/$VERSION/pages/conf.md; \
ln -sf /mnt/storage/view/data /mnt/vault/$VERSION/view/data; \

touch /mnt/vault/ini-$VERSION