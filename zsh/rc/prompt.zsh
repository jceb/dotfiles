# set colors for use in prompts
if zrcautoload colors && colors 2>/dev/null ; then
    BLUE="%{${fg[blue]}%}"
    RED="%{${fg_bold[red]}%}"
    GREEN="%{${fg[green]}%}"
    CYAN="%{${fg[cyan]}%}"
    MAGENTA="%{${fg[magenta]}%}"
    YELLOW="%{${fg[yellow]}%}"
    WHITE="%{${fg[white]}%}"
    NO_COLOUR="%{${reset_color}%}"
else
    BLUE=$'%{\e[1;34m%}'
    RED=$'%{\e[1;31m%}'
    GREEN=$'%{\e[1;32m%}'
    CYAN=$'%{\e[1;36m%}'
    WHITE=$'%{\e[1;37m%}'
    MAGENTA=$'%{\e[1;35m%}'
    YELLOW=$'%{\e[1;33m%}'
    NO_COLOUR=$'%{\e[0m%}'
fi

# increase path length to 80 characters
grml_prompt_token_default+=(
    path              '%80<..<%~%<< '
)

# vcs quilt
zstyle ':vcs_info:*' use-quilt true
zstyle ':vcs_info:*' quilt-standalone "always"
zstyle ':vcs_info:*' get-unapplied true
zstyle ':vcs_info:*' nopatch-format " %n/%a"
zstyle ':vcs_info:*' patch-format " %p %n/%a"
zstyle ':vcs_info:-quilt-.quilt-standalone:*' formats " ${MAGENTA}(${NO_COLOUR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${RED}%Q${MAGENTA}]${NO_COLOUR}"
zstyle ':vcs_info:-quilt-.quilt-standalone:*' nopatch-format "%n/%a"
zstyle ':vcs_info:-quilt-.quilt-standalone:*' patch-format "${CYAN}%p %n/%a${NO_COLOUR}"

F="${MAGENTA}(${NO_COLOR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${GREEN}%b${CYAN}%Q${MAGENTA}]%m${NO_COLOR} "
AF="${MAGENTA}(${NO_COLOR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${GREEN}%b${CYAN}%Q${YELLOW}|${RED}%a${MAGENTA}]%m${NO_COLOR} "
BF="%b${RED}:${YELLOW}%r"
zstyle ':vcs_info:*'              actionformats "$AF" "zsh: %r"
zstyle ':vcs_info:*'              formats       "$F"  "zsh: %r"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat  "$BF"

# Source: http://eseth.org/2010/git-in-zsh.html
# Show remote ref name and number of commits ahead-of or behind
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true

function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        # for git prior to 1.7
        # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${GREEN}+${ahead}${NO_COLOUR}" )

        # for git prior to 1.7
        # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${RED}-${behind}${NO_COLOUR}" )

        if [[ ${#gitstatus} -gt 0 ]]; then
            hook_com[branch]="${hook_com[branch]} ${MAGENTA}${remote}${NO_COLOUR} ${(j:/:)gitstatus}"
        else
            hook_com[branch]="${hook_com[branch]} ${MAGENTA}${remote}${NO_COLOUR}"
        fi
    fi
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" ${MAGENTA}(${GREEN}${stashes} stashed${MAGENTA})"
    fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

# prompt definition
grml_theme_add_token percentnbsp '%# '
zstyle ':prompt:grml:left:setup' items rc path vcs newline user at host percentnbsp
zstyle ':prompt:grml:right:setup' items ''

# vi: ft=zsh:tw=0:sw=4:ts=4:et
