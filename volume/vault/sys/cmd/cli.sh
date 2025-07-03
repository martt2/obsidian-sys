#! /bin/bash

UUID=$(uuidgen)
USER=$1
NAME=$2
TAG
BTN=$( cat <<EOF
 |-
  \`\`\`meta-bind-button
  label: active
  icon: ""
  style: default
  class: ""
  cssStyle: ""
  tooltip: ""
  id: ""
  hidden: false
  actions:
    - type: command
      command: ""
  
  \`\`\`

EOF

)