#!/usr/bin/env -S bash
# Sets the git identity for git repositories
#
# Usage:
# Store file ensure_git_identity.sh in ~/.config/direnv/lib/ensure_git_identity.sh
# Store file set_git_identity.sh in a file in ~/.config/direnv/
# Install git-identity: https://github.com/madx/git-identity
# Create a number of digital identities
# Create .envrc with the following content
# use git_identity <IDENTITY>
set -euo pipefail

use_git_identity() {
    # 1: identity
    find . -maxdepth 3 -type d -name .git -print0 | xargs -0 -n 1 -P 8 "$(dirname "${BASH_SOURCE}")/../set_git_identity.sh" "$1" "${PWD}"

    # Synchronous implementation:
    # find . -type d -name .git | while read dir; do
    #     local repo="$(dirname "${dir}")"
    #     (cd "${repo}" && if [ "$(git config user.identity)" != "${1}" ]; then
    #         echo "Setting git identity to '$1' for repository ${repo}"
    #         git identity "$1"
    #     fi)
    # done
}
