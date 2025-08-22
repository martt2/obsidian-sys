#! /bin/bash

UUID=$(uuidgen)
USER=$1
TYPE=$2
DATABASE=$3
NAME=$4
RULE=$5
IFS=','
read -r -a TAG <<< "$6"

if [[ $IS_REQ = true ]]; then
    USER=$(jq -r '.user' $REQ)
    TYPE=$(jq -r '.type' $REQ)
    DATABASE=$(jq -r '.database' $REQ)
    NAME=$(jq -r '.name' $REQ)
    RULE=$(jq -r '.rule' $REQ)
    IFS=$'\n'
    TAG=($(jq -r '.tag[]' $REQ))
fi

YAML=$( cat <<-EOF

sys_id: $UUID
sys_database: $DATABASE
sys_user: $USER
sys_name: $NAME
sys_rule: $RULE
sys_type: $TYPE
sys_actived: false
sys_archived: false

$(
    [[ "${#TAG[@]}" > 0 ]] && \
        echo -e "sys_tag:\n$(
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
echo -e "$CONTROL_VAULE" > /mnt/storage/view/$DATABASE/data/$UUID.md

# executa database
if [[ $TYPE == "database" ]]; then
    # cria database no conf
    /bin/bash $DIR_CMD/lib/conf-db-add.sh $UUID $DATABASE $NAME

    # cria a view
    mkdir -p /mnt/storage/view/$UUID/data
    cat /mnt/vault/sys/model/database.md > /mnt/storage/view/$UUID/main.md
fi
