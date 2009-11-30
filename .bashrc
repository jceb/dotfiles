# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set -o emacs
#set -o vi

#bind -m vi-command "\C-e":vi-append-eol
#bind -m vi-insert "\C-e":vi-append-eol
#bind -m vi-command "\C-a":vi-insert-beg
#bind -m vi-insert "\C-a":vi-insert-beg
#bind -m vi-insert "\C-k":vi-delete-to
#bind -m vi-command "\C-r": reverse-search-history
#bind -m vi-insert "\C-r": reverse-search-history

export HISTFILE=~/.history

LANG=en_US.UTF-8; export LANG
#LANGUAGE=$LANG
#LC_ALL=$LANG
EDITOR=/usr/bin/vim;          export EDITOR
EMAIL=jceb@e-jc.de;           export EMAIL
PAGER=less;                   export PAGER
LESS="--ignore-case -r -FSX"; export LESS
GPG_TTY=$(tty);               export GPG_TTY
QUILT_PATCHES=debian/patches; export QUILT_PATCHES
BC_ENV_ARGS=~/.bcrc;          export BC_ENV_ARGS
GREP_OPTIONS='--color=auto --exclude=\*\.svn-base --exclude=\*\.tmp --binary-files=without-match'; export GREP_OPTIONS

# set PATH so it includes user's private bin if it exists
[ -d ~/bin ] && PATH=~/bin:"${PATH}"

# Comment for support call

PYTHONPATH=~/MyFiles/Projekte/:/home/jceb/lib/python; export PYTHONPATH
PYTHONSTARTUP=/home/jceb/.pystartup;                  export PYTHONSTARTUP

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto -CF'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -AF'

# Define your own aliases here ...
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
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
