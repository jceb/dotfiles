export HISTFILE="${HOME}/.historyzsh"
export HISTSIZE="1000"
export SAVEHIST="1000"
export DIRSTACKSIZE="11"
export TMPDIR="${HOME}/.cache/tmp"

if $(locale -a|grep -q en_US.utf8); then
	export LANG="en_US.UTF-8"
else
	export LANG="C"
fi
# to get around sorting issues, define differently
export LC_COLLATE="C"

export EDITOR="nvim"
# export GIT_EDITOR=~/.local/bin/nvim
# change cursor shape in nvim
export NVIM_TUI_ENABLE_CURSOR_SHAPE="1"
# use true colors in the terminal - seems to produce weird colors
export NVIM_TUI_ENABLE_TRUE_COLOR="1"

# export EMAIL=put me in ~/.zshother
export BROWSER="x-www-browser"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# add -F to automatically quit less if page fits on one screen
export LESS="--ignore-case -rSX"
export PAGER="less"

# export TTY properly to support gnupg
export GPG_TTY="$(tty)"
if [ -z "${GPG_AGENT_INFO}" ]; then
	export GPG_AGENT_INFO="${HOME}/.gnupg/S.gpg-agent"
fi

export FZF_DEFAULT_COMMAND='rg -i --files --hidden --follow'
export FZF_DEFAULT_OPTS='--bind ctrl-z:toggle-all --color=light'

# quilt settings, always look for patches in the debian/patches directory
export QUILT_PATCHES="debian/patches"
export QUILT_DIFF_ARGS="--color=auto"

# bc settings
export BC_ENV_ARGS="${HOME}/.bcrc"

# go lang settings
export GOPATH="${HOME}/.local/go"
export GOBIN="${HOME}/.local/bin"

export ANDROID_HOME="${HOME}/Android/Sdk"

# set PATH so it includes user's private bin if it exists
for i in "${HOME}/Documents/toolshed/" "${HOME}/.cabal/bin" "${HOME}/.local/bin" "${HOME}/bin" "${HOME}/.gem/ruby/2.3.0/bin" "${GOBIN}" "${HOME}/node_modules/.bin" "${HOME}/.cargo/bin" "${ANDROID_HOME}/tools"; do
	if [ -e "$i" ]; then
		PATH="$i:${PATH}"
	fi
done
export PATH
for i in "${HOME}/.local/share/man" "/"; do
	if [ -e "$i" ]; then
		MANPATH="$i:${MANPATH}"
	fi
done
export MANPATH

# PYTHONPATH=~/lib/python;		export PYTHONPATH
export PYTHONSTARTUP="${HOME}/.pystartup"
export AWT_TOOLKIT="MToolkit"
export _JAVA_AWT_WM_NONREPARENTING="1"

# source personal settings from .zshother
[ -e $HOME/.zshother ] && . ~/.zshother

# vi: ft=zsh:tw=0:sw=4:ts=4
