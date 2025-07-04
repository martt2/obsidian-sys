#! /bin/bash

UUID=$(uuidgen)
USER=$1
NAME=$2
TAG="$(echo $3 | sed 's|\(^.\)|#\1|g' | sed 's|#|\n - |g')"

BTN=$(cat <<-EOF
|-
  \`BUTTON[btn-work, btn-remove]\`

  \`\`\`meta-bind-embed
  [[sys/model/meta-bind-embed/btn-view]]
  \`\`\`

EOF

)

VIEW=$(cat <<-EOF
---
id: $UUID
user: $USER
name: $NAME
tag: $TAG
btn: $BTN
---

EOF

)

mkdir $STORAGE/data/$UUID
echo -e "$VIEW" > $STORAGE/view/data/$UUID.md