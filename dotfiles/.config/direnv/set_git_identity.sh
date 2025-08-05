#!/usr/bin/env -S bash
set -euo pipefail

# 1: identity
# 2: current directory
# 3: relative path to .git folder in repository

(
    cd "$(dirname "${2}/${3}")" && if [ "$(git config user.identity)" != "${1}" ]; then
        echo "Setting git identity to '$1' for repository ${3}"
        git identity "$1"
    fi
)

(
    cd "$(dirname "${2}/${3}/..")" && if [ -d .jj ] && [ "$(jj config get user.identity)" != "${1}" ]; then
        echo "Setting jj identity to '$1' for repository ${3}"
        jj-identity "$1"
    fi
)
