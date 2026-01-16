#! /bin/bash

LOG=$( cat <<-EOF
---
VERSION: $VERSION
VAULT: $VAULT
STORAGE: $STORAGE
SESSION: $SESSION

$(cat /tmp/share/data/$SESSION/data.json)

EOF

)

#TEST=$( _python $DIR_CMD/lib/test.py )
#echo $TEST

echo "$LOG"