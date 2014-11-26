HISTFILE=~/.historyzsh
HISTSIZE=1000
SAVEHIST=1000
DIRSTACKSIZE=11

if $(locale -a|grep -q en_US.utf8); then
	export LANG=en_US.UTF-8
else
	export LANG=C
fi
# to get around sorting issues, define differently
export LC_COLLATE="C"

EDITOR=vim;						export EDITOR
GIT_EDITOR=/usr/bin/vim			export GIT_EDITOR
#EMAIL=put me in ~/.zshother;	export EMAIL
BROWSER=x-www-browser;			export BROWSER

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# add -F to automatically quit less if page fits on one screen
LESS="--ignore-case -rSX";		export LESS
PAGER=less;						export PAGER
# PAGER=vimpager;						export PAGER

# export TTY properly to support gnupg
GPG_TTY=$(tty);					export GPG_TTY

# quilt settings, always look for patches in the debian/patches directory
QUILT_PATCHES=debian/patches;	export QUILT_PATCHES
QUILT_DIFF_ARGS="--color=auto";	export QUILT_DIFF_ARGS

# bc settings
BC_ENV_ARGS=~/.bcrc;			export BC_ENV_ARGS

# go lang settings
GOPATH="${HOME}/go";			export GOPATH

# set PATH so it includes user's private bin if it exists
for i in "$HOME/.gem/ruby/1.9.1/bin" "$HOME/Documents/toolshed/" "$HOME/.cabal/bin" "$HOME/.local/bin" "$HOME/bin" "$HOME/.gem/ruby/2.1.0/bin" "${GOPATH}/bin"; do
	if [ -e "$i" ]; then
		PATH="$i:${PATH}"
	fi
done
export PATH

# PYTHONPATH=~/lib/python;		export PYTHONPATH
PYTHONSTARTUP=~/.pystartup;		export PYTHONSTARTUP
AWT_TOOLKIT=MToolkit;			export AWT_TOOLKIT
_JAVA_AWT_WM_NONREPARENTING=1;	export _JAVA_AWT_WM_NONREPARENTING

#[ -z "$GPG_AGENT_INFO" ] && [ -e $HOME/.gnupg/gpg-agent-info-$(hostname) ] && . $HOME/.gnupg/gpg-agent-info-$(hostname) && export GPG_AGENT_INFO

# source personal settings from .zshother
[ -e $HOME/.zshother ] && . ~/.zshother

# vi: ft=zsh:tw=0:sw=4:ts=4
