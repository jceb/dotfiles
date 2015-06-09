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

# FIXME: dive into the GRML prompt configuration
# if [[ "$TERM" == dumb ]] ; then
#     PROMPT="${EXITCODE}${debian_chroot:+($debian_chroot)}%n@%m %40<...<%B%~%b%<< "
# else
#     # only if $GRMLPROMPT is set (e.g. via 'GRMLPROMPT=1 zsh') use the extended
#     # prompt set variable identifying the chroot you work in (used in the
#     # prompt below)
#     if [[ $GRMLPROMPT -gt 0 ]] ; then
#         PROMPT="${RED}${EXITCODE}${CYAN}[%j running job(s)] ${GREEN}{history#%!} ${RED}%(3L.+.) ${BLUE}%* %D
# ${BLUE}%n${NO_COLOUR}@%m %40<...<%B%~%b%<< "
#     else
#         # This assembles the primary prompt string
#         if (( EUID != 0 )); then
#             PROMPT="${RED}${EXITCODE}${NO_COLOUR}%* %80<...<%B%~%b%<< \${vcs_info_msg_0_}
# ${WHITE}${debian_chroot:+($debian_chroot)}${BLUE}%B%n%b${NO_COLOUR}@%m%# "
#         else
#             PROMPT="${BLUE}${EXITCODE}${NO_COLOUR}%* %80<...<%B%~%b%<< \${vcs_info_msg_0_}
# ${WHITE}${debian_chroot:+($debian_chroot)}${RED}%B%n%b${NO_COLOUR}@%m%# "
#         fi
#     fi
# fi

zstyle ':vcs_info:*' use-quilt true
zstyle ':vcs_info:*' quilt-standalone "always"
zstyle ':vcs_info:*' get-unapplied true
zstyle ':vcs_info:*' nopatch-format " %n/%a"
zstyle ':vcs_info:*' patch-format " %p %n/%a"
zstyle ':vcs_info:-quilt-.quilt-standalone:*' formats " ${MAGENTA}(${NO_COLOUR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${RED}%Q${MAGENTA}]${NO_COLOUR}"
zstyle ':vcs_info:-quilt-.quilt-standalone:*' nopatch-format "%n/%a"
zstyle ':vcs_info:-quilt-.quilt-standalone:*' patch-format "${CYAN}%p %n/%a${NO_COLOUR}"

typeset -A grml_vcs_coloured_formats
typeset -A grml_vcs_plain_formats

grml_vcs_plain_formats=(
    format "(%s%)-[%b%Q] "    "zsh: %r"
    actionformat "(%s%)-[%b%Q|%a] " "zsh: %r"
    rev-branchformat "%b:%r"
)

grml_vcs_coloured_formats=(
    format "${MAGENTA}(${NO_COLOR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${GREEN}%b${CYAN}%Q${MAGENTA}]${NO_COLOR} "
    actionformat "${MAGENTA}(${NO_COLOR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${GREEN}%b${CYAN}%Q${YELLOW}|${RED}%a${MAGENTA}]${NO_COLOR} "
    rev-branchformat "%b${RED}:${YELLOW}%r"
)

typeset GRML_VCS_COLOUR_MODE=xxx

grml_vcs_info_toggle_colour () {
    emulate -L zsh
    if [[ $GRML_VCS_COLOUR_MODE != plain ]]; then
        grml_vcs_info_set_formats coloured
    else
        grml_vcs_info_set_formats plain
    fi
    return 0
}

grml_vcs_info_set_formats () {
    emulate -L zsh
    #setopt localoptions xtrace
    local mode=$1 AF F BF
    if [[ $mode == coloured ]]; then
        AF=${grml_vcs_coloured_formats[actionformat]}
        F=${grml_vcs_coloured_formats[format]}
        BF=${grml_vcs_coloured_formats[rev-branchformat]}
        GRML_VCS_COLOUR_MODE=coloured
    else
        AF=${grml_vcs_plain_formats[actionformat]}
        F=${grml_vcs_plain_formats[format]}
        BF=${grml_vcs_plain_formats[rev-branchformat]}
        GRML_VCS_COLOUR_MODE=plain
    fi

    zstyle ':vcs_info:*'              actionformats "$AF" "zsh: %r"
    zstyle ':vcs_info:*'              formats       "$F"  "zsh: %r"
    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat  "$BF"
    return 0
}

grml_vcs_info_toggle_colour

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

        hook_com[branch]="${hook_com[branch]}→${remote} ${(j:/:)gitstatus}"
    fi
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" (${stashes} stashed)"
    fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

# vi: ft=zsh:tw=0:sw=4:ts=4:et
