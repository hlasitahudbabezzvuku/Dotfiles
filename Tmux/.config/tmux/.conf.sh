#!/usr/bin/env bash

set -euo pipefail

declare -a required_software=(
    "tmux"
)

for item in "${required_software[@]}"; do
    if ! type "${item}"; then
        printf "%sExecutable \"%s\" could not be found%s\n" "$( tput setaf 1 )" "${item}" "$( tput sgr0 )"
        exit 1
    fi
done
