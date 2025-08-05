#! /bin/bash

if [[ $IS_REQ ]]; then
    ITEM=$(jq -r '.item' $REQ)
    IFS=$'\n' ARR=($(jq -r '.arr[]' $REQ))
fi

LOG=$( cat <<-EOF
---
VERSION: $VERSION
VAULT: $VAULT
STORAGE: $STORAGE

$@

CLIENT_ID: $CLIENT_ID

ITEM: $ITEM
ARR: ${ARR[@]}

EOF

)

echo "$LOG"

#echo -e "$LOG" >> /tmp/server/log/server.log