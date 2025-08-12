#! /bin/bash

UUID=$(uuidgen)
USER=$1
TYPE=$2
DATABASE=$3
NAME=$4
RULE=$5
IFS=','
read -r -a TAG <<< "$6"

if [[ $IS_REQ ]]; then
    USER=$(jq -r '.user' $REQ)
    TYPE=$(jq -r '.type' $REQ)
    DATABASE=$(jq -r '.database' $REQ)
    NAME=$(jq -r '.name' $REQ)
    RULE=$(jq -r '.rule' $REQ)
    IFS=$'\n'
    TAG=($(jq -r '.tag[]' $REQ))
fi

CONTROL=view/$DATABASE/data/$UUID.md
NOTE="[open note]($CONTROL)"

YAML=$( cat <<-EOF

id: $UUID
user: $USER
name: $NAME
rule: $RULE
note: "$NOTE"
type: $TYPE
archived: false

$(
    [[ "${#TAG[@]}" > 0 ]] && \
        echo -e "tag:\n$(
            echo "${TAG[@]}" | xargs -d' ' -I {} echo "  - {}"
        )"
)

EOF

)

# remove linhas vazias
YAML=$( echo -e "$YAML" | sed '/^$/d' )

CONTROL_VAULE=$(cat <<-EOF
---
$YAML
---

\`\`\`meta-bind-embed
[[sys/model/control-$TYPE]]
\`\`\`

EOF

)

# cria o controle
echo -e "$CONTROL_VAULE" > /mnt/storage/$CONTROL

# executa database
[[ $TYPE == "database" ]] && \
    /usr/local/bin/obsidian-cli _database-create $UUID $DATABASE $NAME
