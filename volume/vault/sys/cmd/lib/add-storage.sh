#! /bin/bash

UUID=$(uuidgen)
USER=$1
NAME=$2
TAG="$(echo $3 | sed 's|\(^.\)|#\1|g' | sed 's|#|\n - |g')"

BTN=$(cat <<-EOF
|-
  \`\`\`meta-bind-button
  label: work
  icon: ""
  style: default
  class: ""
  cssStyle: ""
  tooltip: ""
  id: ""
  hidden: false
  actions:
    - type: inlineJS
      code: console.log("Hello world")
      args: {}
  
  \`\`\`

EOF

)

VIEW=$(cat <<-EOF
---
user: $USER
name: $NAME
tag: $TAG
btn: $BTN
---

EOF

)

mkdir $STORAGE/data/$UUID
echo -e "$VIEW" > $STORAGE/view/data/$UUID.md