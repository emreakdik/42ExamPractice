#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAIN_DIR="$SCRIPT_DIR/.resources/main"

if [ ! -d "$MAIN_DIR" ]; then
    echo "Error: .resources/main directory was not found." >&2
    exit 1
fi

cd "$MAIN_DIR" || exit 1
bash menu.sh
