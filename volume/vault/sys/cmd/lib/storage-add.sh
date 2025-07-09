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

# $NAME

---

\`\`\`meta-bind-embed
[[sys/model/meta-bind-embed/btn-control]]
\`\`\`

\`\`\`meta-bind-embed
[[sys/model/meta-bind-embed/btn-goto]]
\`\`\`

EOF

)

mkdir $STORAGE/data/$UUID
echo -e "$VIEW" > $STORAGE/view/data/$UUID.md