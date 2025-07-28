#! /bin/bash

UUID=$(uuidgen)
USER=$1
NAME=$2
TAG="$(echo $3 | sed 's|\(^.\)|#\1|g' | sed 's|#|\n - |g')"
NOTE="[open note](view/data/$UUID.md)"

VIEW=$(cat <<-EOF
---
id: $UUID
user: $USER
name: $NAME
tag: $TAG
note: "$NOTE"
---

\`\`\`meta-bind-embed
[[sys/model/view]]
\`\`\`

EOF

)

mkdir -p /mnt/storage/data/$UUID
echo -e "$VIEW" > /mnt/storage/view/data/$UUID.md