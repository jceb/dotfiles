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

export EDITOR=vim
export GIT_EDITOR=/usr/bin/vim
# export EMAIL=put me in ~/.zshother
export BROWSER=x-www-browser

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# add -F to automatically quit less if page fits on one screen
export LESS="--ignore-case -rSX"
export PAGER=less
# export PAGER=vimpager

# export TTY properly to support gnupg
export GPG_TTY=$(tty)
if [ -z "${GPG_AGENT_INFO}" ]; then
	export GPG_AGENT_INFO="$HOME/.gnupg/S.gpg-agent"
fi

# quilt settings, always look for patches in the debian/patches directory
export QUILT_PATCHES=debian/patches
export QUILT_DIFF_ARGS="--color=auto"

# bc settings
export BC_ENV_ARGS=~/.bcrc

# go lang settings
export GOPATH="${HOME}/.local/go"

# set PATH so it includes user's private bin if it exists
for i in "${HOME}/.gem/ruby/1.9.1/bin" "${HOME}/Documents/toolshed/" "${HOME}/.cabal/bin" "${HOME}/.local/bin" "${HOME}/bin" "${HOME}/.gem/ruby/2.1.0/bin" "${GOPATH}/bin" "${HOME}/node_modules/ttystudio/bin"; do
	if [ -e "$i" ]; then
		PATH="$i:${PATH}"
	fi
done
export PATH

# PYTHONPATH=~/lib/python;		export PYTHONPATH
export PYTHONSTARTUP=~/.pystartup
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

# source personal settings from .zshother
[ -e $HOME/.zshother ] && . ~/.zshother

# vi: ft=zsh:tw=0:sw=4:ts=4
