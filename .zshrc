fpath=($HOME/.zsh/functions $fpath)

# enable color support
if test "$TERM" != "dumb"; then
    eval "$(dircolors -b)"
fi

autoload -U zutil
autoload -U compinit
autoload -U complist

# Activation
compinit

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '^K' kill-whole-line
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

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -r vicmd v
bindkey -M vicmd v edit-command-line

autoload -Uz insert-second-last-word
zle -N insert-second-last-word
bindkey -r "^[,"
bindkey -M emacs "^[," insert-second-last-word

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
	source $file
done

# vi: ft=zsh:tw=0:sw=4:ts=4
