# export TMPDIR="$HOME/.cache/tmp"
# # speed up certain system calls: https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
# # WARNING this advice seems to break Thunderbird's time display
# # export TZ=:/etc/localtime
#
# if locale -a|grep -q en_US.utf8
# 	export LANG="en_US.UTF-8"
# else
# 	export LANG="C"
# end
# # to get around sorting issues, define differently
# export LC_COLLATE="en_US.UTF-8"
# # export LC_COLLATE="C"
#
# export EDITOR="vim"
# # export GIT_EDITOR ~/.local/bin/nvim
# # use true colors in the terminal - seems to produce weird colors
# export NVIM_TUI_ENABLE_TRUE_COLOR="1"
#
# # export EMAIL put me in ~/.config/fish/conf.d/other.fish
# # export EMAIL "jceb@e-jc.de"
# export BROWSER="x-www-browser"
#
# # make less more friendly for non-text input files, see lesspipe(1)
# if test -x /usr/bin/lesspipe
# 	eval (lesspipe)
# end
# # add -F to automatically quit less if page fits on one screen
# export LESS="--ignore-case -rSX"
# export PAGER="less"

# export TTY properly to support gnupg
export GPG_TTY=(tty)

if test -z "$GPG_AGENT_INFO"
    export GPG_AGENT_INFO="/run/user/"(getent passwd jceb|awk -F: '{print $3}')"/gnupg/S.gpg-agent"
end
if test -z "$SSH_AUTH_SOCK"
    export SSH_AUTH_SOCK="/run/user/"(getent passwd jceb|awk -F: '{print $3}')"/gnupg/S.gpg-agent.ssh"
end

# export FZF_DEFAULT_COMMAND='command rg -i --files --no-ignore --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_OPTS='--bind ctrl-z:toggle-all --color=light'
#
# # quilt settings, always look for patches in the debian/patches directory
# export QUILT_PATCHES="debian/patches"
# export QUILT_DIFF_ARGS="--color=auto"
#
# # bc settings
# export BC_ENV_ARGS="$HOME/.bcrc"
#
# # go lang settings
# export GOPATH="$HOME/.local/go"
#
# export ANDROID_HOME="$HOME/Android/Sdk"
#
# export LD_LIBRARY_PATH="$HOME/.local/lib"
#
# # set PATH so it includes user's private bin if it exists
# for i in "$HOME/Documents/toolshed/" "$HOME/.cabal/bin" "$HOME/.local/bin" "$HOME/bin" "$HOME/.gem/ruby/2.3.0/bin" "$HOME/.gem/ruby/2.4.0/bin" "$GOPATH/bin" "$HOME/.yarn/bin" "$HOME/.npm-global/bin" "$HOME/.cargo/bin" "$ANDROID_HOME/emulator" "$ANDROID_HOME/platform-tools" "$ANDROID_HOME/tools" "/var/lib/snapd/snap/bin"
# 	if test -d "$i"; and not contains $i $PATH
# 		set -x PATH $i $PATH
# 	end
# end
#
# for i in "$HOME/.local/share/man" '/usr/share/man'
# 	if test -d "$i"; and not contains $i $MANPATH
# 		export MANPATH="$i:$MANPATH"
# 	end
# end
#
# # PYTHONPATH=~/lib/python;		export PYTHONPATH
# export PYTHONSTARTUP="$HOME/.pystartup"
#
# export XTERM_VERSION='XTerm(327)'
#
# export HIGHLIGHT_OPTIONS='--style=seashell'
#
# export WINIT_HIDPI_FACTOR='1.0'
#
# # vi: ft=fish:tw=0:sw=4:ts=4
