#! /bin/bash

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

mkdir -p $STORAGE/data/
mkdir -p $STORAGE/view/data/
mkdir -p $STORAGE/custom/js
mkdir -p $STORAGE/custom/css
mkdir -p $STORAGE/custom/cmd
[[ -f $STORAGE/conf.md ]] || echo -e "$CONF" > $STORAGE/conf.md

# chmod +x $VAULT/sys/cmd/*; \
# chmod +x $VAULT/sys/cmd/lib/*; \

ln -sf $STORAGE/conf.md $VAULT/pages/conf.md; \
ln -sf $STORAGE/view/data $VAULT/view/data; \

touch $VAULT/sys/ini