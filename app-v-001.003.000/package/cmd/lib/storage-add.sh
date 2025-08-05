#! /bin/bash

UUID=$(uuidgen)
USER=$1
NAME=$2
IFS=',' read -r -a TAG <<< "$3"
NOTE="[open note](view/data/$UUID.md)"

if [[ $IS_REQ ]]; then
    USER=$(jq -r '.user' $REQ)
    NAME=$(jq -r '.name' $REQ)
    IFS=$'\n' TAG=($(jq -r '.tag[]' $REQ))
fi

YAML=$( cat <<-EOF

id: $UUID
user: $USER
name: $NAME
note: "$NOTE"
$(
    [[ "${#TAG[@]}" > 0 ]] && \
        echo -e "tag:\n$(
            echo  "${TAG[@]}" | xargs -d' ' -I {} echo "  - {}"
        )"
)

EOF

)

YAML=$( echo -e "$YAML" | sed '/^$/d' )

VIEW=$(cat <<-EOF
---
$YAML
---

\`\`\`meta-bind-embed
[[sys/model/view]]
\`\`\`

EOF

)

mkdir -p /mnt/storage/data/$UUID
echo -e "$VIEW" > /mnt/storage/view/data/$UUID.md