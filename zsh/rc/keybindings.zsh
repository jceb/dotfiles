fpath=($HOME/.zsh/functions $fpath)

BLOCK=2
UNDERLINE=4
IBEAM=6
change_cursorshape () {
    tmux_head=
    tmux_tail=
    if [ -n "${TMUX}" ]; then
        tmux_head="\ePtmux;\e"
        tmux_tail="\e\\"
    fi
    printf "${tmux_head}\e[${1} q${tmux_tail}"
}

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line

# other cool stuff
# Esc-q push-line/input so the you can execute another command
# Esc-? run which command on the current command

# emacs keybindings by default - but the escape key starts vi-cmd-mode to do the real stuff ;-)
# btw, this is a really collegue friendly setup
bindkey -r "^ed"
bindkey -r "^["
set_vi_mode () {
    change_cursorshape "${UNDERLINE}"
    zle -K vicmd
}
zle -N set_vi_mode
# bindkey -M emacs "^[" set_vi_mode
bindkey -M emacs "^[" vi-cmd-mode
bindkey -r "^y"
bindkey -M emacs "^y" push-input
# bindkey -M emacs "^h" backward-kill-word
bindkey -M emacs "^[^h" slash-backward-kill-word
bindkey -M emacs "" slash-backward-kill-word
bindkey -M vicmd "?" vi-history-search-backward
bindkey -M vicmd "/" vi-history-search-forward
bindkey -M vicmd 'v' edit-command-line
set_emacs_mode () {
    change_cursorshape "${IBEAM}"
    zle vi-insert
}
zle -N set_emacs_mode
#bindkey -M vicmd 'i' set_emacs_mode

autoload -Uz insert-second-last-word
zle -N insert-second-last-word
bindkey -r "^[,"
bindkey -M emacs "^[," insert-second-last-word
# bindkey -M emacs "¬" insert-second-last-word
# bindkey -M emacs "®" insert-last-word

_fg () {
    fg
}
zle -N _fg
bindkey -r "^f"
bindkey -M emacs "^f" _fg

# vi: ft=zsh:tw=0:sw=4:ts=4
