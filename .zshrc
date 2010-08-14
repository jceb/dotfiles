# Lines configured by zsh-newuser-install

HISTFILE=~/.historyzsh
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS='._,():;!@#$%^&*=+-?\<>[]{}~`"' # Make the Alt-Backspace bash alike

# append to history from all shell so that not just the last shell closed can save their history
#setopt SHARE_HISTORY
setopt APPEND_HISTORY

# improve globbing
#setopt extendedglob

#setopt chaselinks
setopt AUTO_PUSHD
setopt AUTO_CD
# ignore multiple copies of the same directory
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt AUTO_CONTINUE

# completion configuration
setopt AUTO_NAME_DIRS
#setopt COMPLETE_IN_WORD
# always show options instead of just completing the first one
unsetopt LIST_AMBIGUOUS
setopt MENU_COMPLETE
setopt GLOB_DOTS

# emacs keybindings by default - but the escape key starts vi-cmd-mode to do the real stuff ;-)
# btw, this is a really collegue friendly setup
bindkey -e
bindkey -r "^["
bindkey -M emacs "^[" vi-cmd-mode
#bindkey -r "^b"
bindkey -r "^h"
bindkey -r "^[h"
bindkey -r "^[H"
bindkey -r "^t"
bindkey -M emacs "^t" history-incremental-search-forward
bindkey -r "^p"
bindkey -r "^n"
bindkey -M emacs "^p" history-search-backward
bindkey -M emacs "^n" history-search-forward
bindkey -M vicmd "^p" history-search-backward
bindkey -M vicmd "^n" history-search-forward
bindkey -r "^y"
bindkey -M emacs "^y" push-input
bindkey -M vicmd "^x" run-help
bindkey -M emacs "^x" run-help
bindkey "^h" backward-kill-word

# other cool stuff
# Esc-q push-line/input so the you can execute another command
# Esc-? run which command on the current command

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz vcs_info

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select=10

# Define your own aliases here ...
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# Use VIM as man pager
# http://www.reddit.com/r/vim/comments/a8k6q/using_vim_as_a_manpage_viewer_under_nix/
vman() {
	export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
		vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
		-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
		-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

	# invoke man page
	man "$@"

	# we must unset the PAGER, so regular man pager is used afterwards
	unset PAGER
}

# function to change directories in an easier way
function ff () { eval "$(~/bin/cd.py $*)" }

# function to copy files back to the system you are coming from
function sshget () {
	if [ -n "$SSH_CLIENT" ]; then
		user=$USER
		if [ "$1" = "-l" -o "$1" = "-u" ]; then
			user="$2"
			shift 2
		fi
		scp "$@" $user@$(echo "$SSH_CLIENT"|awk '{print $1}'):
	else
		echo "You are not connected with this host via SSH" 1>&2
	fi
}

#PS1=$'%{\e[1;31m%}%n%{\e[0m%}@%{\e[1;32m%}%m%{\e[0m%}:%1~%{\e[1;33m%}%#%{\e[0m%} '

# Phil!'s ZSH Prompt http://aperiodic.net/phil/prompt/
function precmd_off {
	local TERMWIDTH
	(( TERMWIDTH = ${COLUMNS} - 1 ))


	###
	# Truncate the path if it's too long.

	PR_FILLBAR=""
	PR_PWDLEN=""

	local promptsize=${#${(%):---(%n@%m:)--}}
	local pwdsize=${#${(%):-%~}}

	if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
		((PR_PWDLEN=$TERMWIDTH - $promptsize))
	else
		PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
	fi


	###
	# Get APM info.

	#if which ibam > /dev/null; then
	#PR_APM_RESULT=`ibam --percentbattery`
	#elif which apm > /dev/null; then
	#PR_APM_RESULT=`apm`
	#fi
}


setopt extended_glob
function preexec () {
	if [[ "$TERM" == "screen" ]]; then
		local CMD=${1[(wr)^(*=*|sudo|-*)]}
		echo -n "\ek$CMD\e\\"
	fi
}

function precmd () {
	vcs_info 'prompt'
}


setprompt () {
	# set formats
	# %b - branchname
	# %u - unstagedstr (see below)
	# %c - stangedstr (see below)
	# %a - action (e.g. rebase-i)
	# %R - repository path
	# %S - path in the repository
	FMT_BRANCH="${PR_GREEN}%b${PR_RESET}" # e.g. master¹²
	FMT_ACTION="(${PR_CYAN}%a${PR_RESET}%)"   # e.g. (rebase-i)
	FMT_PATH="%R${PR_YELLOW}/%S"              # e.g. ~/repo/subdir

	# check-for-changes can be really slow.
	# you should disable it, if you work with large repositories
	#zstyle ':vcs_info:*:prompt:*' check-for-changes true
	#zstyle ':vcs_info:*:prompt:*' unstagedstr '¹'  # display ¹ if there are unstaged changes
	#zstyle ':vcs_info:*:prompt:*' stagedstr '²'    # display ² if there are staged changes
	zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}" ""
	zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"              ""
	#zstyle ':vcs_info:*:prompt:*' nvcsformats   ""                             "%~"

	###
	# Need this so the prompt will work.

	setopt prompt_subst


	###
	# See if we can use colors.

	autoload colors zsh/terminfo
	if [[ "$terminfo[colors]" -ge 8 ]]; then
		colors
	fi
	for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
		eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
		eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
		(( count = $count + 1 ))
	done
	PR_NO_COLOUR="%{$terminfo[sgr0]%}"


	###
	# See if we can use extended characters to look nicer.

	typeset -A altchar
	set -A altchar ${(s..)terminfo[acsc]}
	PR_SET_CHARSET="%{$terminfo[enacs]%}"
	PR_SHIFT_IN="%{$terminfo[smacs]%}"
	PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
	PR_HBAR=${altchar[q]:--}
	PR_ULCORNER=${altchar[l]:--}
	PR_LLCORNER=${altchar[m]:--}
	PR_LRCORNER=${altchar[j]:--}
	#PR_URCORNER=${altchar[k]:--}
	PR_URCORNER=${PR_HBAR}


	###
	# Decide if we need to set titlebar text.

	case $TERM in
		xterm*)
			PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
			;;
		screen)
			PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
			;;
		*)
			PR_TITLEBAR=''
			;;
	esac


	###
	# Decide whether to set a screen title
	if [[ "$TERM" == "screen" ]]; then
		PR_STITLE=$'%{\ekzsh\e\\%}'
	else
		PR_STITLE=''
	fi


	###
	# APM detection

	#if which ibam > /dev/null; then
	#PR_APM='$PR_RED${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
	#elif which apm > /dev/null; then
	#PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
	#else
	#PR_APM=''
	#fi


	###
	# Finally, the prompt.

	PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_GREEN%(!.%SROOT%s.%n)$PR_WHITE@$PR_RED%m\
$PR_BLUE \
${vcs_info_msg_0_} $PR_MAGENTA%$PR_PWDLEN<...<%~%<<\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
%(!.$PR_RED.$PR_NO_COLOUR)%# $(date +'%H:%M')${PR_BLUE})$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_NO_COLOUR '

#    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
#$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
#$PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m:%l\
#$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR${(e)PR_FILLBAR}$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
#$PR_MAGENTA%$PR_PWDLEN<...<%~%<<\
#$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\
#
#$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
#%(?..$PR_LIGHT_RED%?$PR_BLUE:)\
#${(e)PR_APM}$PR_YELLOW%D{%H:%M}\
#$PR_LIGHT_BLUE:%(!.$PR_RED.$PR_WHITE)%#$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
#$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
#$PR_NO_COLOUR '

#    RPROMPT=' $PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_BLUE$PR_HBAR$PR_SHIFT_OUT\
#($PR_YELLOW%D{%a,%b%d}$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'

PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt

# source cdargs bash binding
[ -e ~/.cdargs-bash.sh ] && source ~/.cdargs-bash.sh
