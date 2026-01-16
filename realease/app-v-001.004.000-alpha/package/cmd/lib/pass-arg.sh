#! /bin/bash

parse_value() {
    local value="$1"

    # se começar com [ ou { assume JSON valido
    if [[ "$value" =~ ^\[.*\]$ || "$value" =~ ^\{.*\}$ ]]; then
        echo "$value"
    # se for true/false
    elif [[ "$value" =~ ^(true|false)$ ]]; then
        echo "$value"
    # se for numero inteiro
    elif [[ "$value" =~ ^[0-9]+$ ]]; then
        echo "$value"
    # se for numero decimal
    elif [[ "$value" =~ ^[0-9]+\.[0-9]+$ ]]; then
        echo "$value"
    # se for lista separada por virgula, converte para array JSON
    elif [[ "$value" =~ , ]]; then
        jq -nc --arg v "$value" '$v | split(",")'
    # caso contrario, string
    else
        jq -nc --arg v "$value" '$v'
    fi
}

JSON="$(cat /tmp/share/data/$SESSION/data.json)"

for arg in "$@"; do
    if [[ "$arg" != *=* ]]; then
        echo "invalid argument: $arg" >&2
        exit 1
    fi

    key="${arg%%=*}"
    value="${arg#*=}"

    parsed=$(parse_value "$value")

    JSON=$(jq -c --arg k "$key" --argjson v "$parsed" '. + {($k): $v}' <<< "$JSON")
done

echo "$JSON" > /tmp/share/data/$SESSION/data.json