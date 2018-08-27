set -x TMPDIR "$HOME/.cache/tmp"
# speed up certain system calls: https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
set -x TZ :/etc/localtime

if locale -a|grep -q en_US.utf8
	set -x LANG "en_US.UTF-8"
else
	set -x LANG "C"
end
# to get around sorting issues, define differently
set -x LC_COLLATE "C"

set -x EDITOR "vim"
# set -x GIT_EDITOR ~/.local/bin/nvim
# use true colors in the terminal - seems to produce weird colors
set -x NVIM_TUI_ENABLE_TRUE_COLOR "1"

# set -x EMAIL put me in ~/.config/fish/conf.d/other.fish
# set -x EMAIL "jceb@e-jc.de"
set -x BROWSER "x-www-browser"

# make less more friendly for non-text input files, see lesspipe(1)
if test -x /usr/bin/lesspipe
	eval (lesspipe)
end
# add -F to automatically quit less if page fits on one screen
set -x LESS "--ignore-case -rSX"
set -x PAGER "less"

# set -x TTY properly to support gnupg
set -x GPG_TTY (tty)
if test -z "$GPG_AGENT_INFO"
	set -x GPG_AGENT_INFO "$HOME/.gnupg/S.gpg-agent"
end

set -x FZF_DEFAULT_COMMAND 'command rg -i --files --no-ignore --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--bind ctrl-z:toggle-all --color=light'

# quilt settings, always look for patches in the debian/patches directory
set -x QUILT_PATCHES "debian/patches"
set -x QUILT_DIFF_ARGS "--color=auto"

# bc settings
set -x BC_ENV_ARGS "$HOME/.bcrc"

# go lang settings
set -x GOPATH "$HOME/.local/go"

set -x ANDROID_HOME "$HOME/Android/Sdk"

set -x LD_LIBRARY_PATH "$HOME/.local/lib"

# set PATH so it includes user's private bin if it exists
for i in "$HOME/Documents/toolshed/" "$HOME/.cabal/bin" "$HOME/.local/bin" "$HOME/bin" "$HOME/.gem/ruby/2.3.0/bin" "$HOME/.gem/ruby/2.4.0/bin" "$GOPATH/bin" "$HOME/.yarn/bin" "$HOME/.npm-global/bin" "$HOME/.cargo/bin" "$ANDROID_HOME/tools"
	if test -d "$i"; and not contains $i $PATH
		set -x PATH $i $PATH
	end
end

for i in "$HOME/.local/share/man" '/usr/share/man'
	if test -d "$i"; and not contains $i $MANPATH
		set -x MANPATH "$i:$MANPATH"
	end
end

# PYTHONPATH=~/lib/python;		set -x PYTHONPATH
set -x PYTHONSTARTUP "$HOME/.pystartup"

set -x XTERM_VERSION 'XTerm(327)'

set -x HIGHLIGHT_OPTIONS '--style=seashell'

# vi: ft=fish:tw=0:sw=4:ts=4
