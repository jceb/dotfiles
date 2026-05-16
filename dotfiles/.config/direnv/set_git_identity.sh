#!/usr/bin/env -S bash
set -euo pipefail

# 1: identity
# 2: current directory
# 3: relative path to .git folder in repository

if [ -z "$1" ]; then
    echo "No identity specified" 1>&2
    exit 1
fi
cd "$(dirname "${2}/${3}/..")"

if git rev-parse --show-toplevel &>/dev/null; then
    if  [ "$(git config user.identity)" != "${1}" ]; then
        echo "Setting git identity to '$1' for repository $(dirname "${3}")"
        git identity "$1"
    fi
fi

if jj workspace root &>/dev/null; then
    if [ "$(jj config get user.identity 2>/dev/null)" != "${1}" ]; then
        echo "Setting jj identity to '$1' for repository $(dirname "${3}")"
        jj-identity -u "$1"
    fi
fi
