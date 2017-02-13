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

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# disable most Esc bindings to reduce interference with vim mode
bindkey -M emacs -r "^[^D" # list-choices
bindkey -M emacs -r "^[^G" # send-break
# bindkey -M emacs -r "^[^H" # slash-backward-kill-word
# bindkey -M emacs -r "^[^I" # self-insert-unmeta
# bindkey -M emacs -r "^[^J" # self-insert-unmeta
bindkey -M emacs -r "^[^L" # clear-screen
# bindkey -M emacs -r "^[^M" # self-insert-unmeta
bindkey -M emacs -r "^[^[OC" # forward-word
bindkey -M emacs -r "^[^[OD" # backward-word
bindkey -M emacs -r "^[^[[C" # forward-word
bindkey -M emacs -r "^[^[[D" # backward-word
bindkey -M emacs -r "^[^_" # copy-prev-word
bindkey -M emacs -r "^[ " # expand-history
bindkey -M emacs -r "^[!" # expand-history
bindkey -M emacs -r "^[\"" # quote-region
bindkey -M emacs -r "^[\$" # spell-word
bindkey -M emacs -r "^['" # quote-line
# bindkey -M emacs -r "^[," # insert-second-last-word
bindkey -M emacs -r "^[-" # neg-argument
# bindkey -M emacs -r "^[." # insert-last-word
bindkey -M emacs -r "^[0" # digit-argument
bindkey -M emacs -r "^[1" # digit-argument
bindkey -M emacs -r "^[2" # digit-argument
bindkey -M emacs -r "^[3" # digit-argument
bindkey -M emacs -r "^[4" # digit-argument
bindkey -M emacs -r "^[5" # digit-argument
bindkey -M emacs -r "^[6" # digit-argument
bindkey -M emacs -r "^[7" # digit-argument
bindkey -M emacs -r "^[8" # digit-argument
bindkey -M emacs -r "^[9" # digit-argument
bindkey -M emacs -r "^[<" # beginning-of-buffer-or-history
bindkey -M emacs -r "^[>" # end-of-buffer-or-history
bindkey -M emacs -r "^[?" # which-command
bindkey -M emacs -r "^[A" # accept-and-hold
# bindkey -M emacs -r "^[B" # backward-word
bindkey -M emacs -r "^[C" # capitalize-word
# bindkey -M emacs -r "^[D" # kill-word
# bindkey -M emacs -r "^[F" # forward-word
bindkey -M emacs -r "^[G" # get-line
bindkey -M emacs -r "^[H" # run-help
bindkey -M emacs -r "^[L" # down-case-word
# bindkey -M emacs -r "^[N" # fzChDir
# bindkey -M emacs -r "^[OA" # up-line-or-search
# bindkey -M emacs -r "^[OB" # down-line-or-search
# bindkey -M emacs -r "^[OC" # forward-char
# bindkey -M emacs -r "^[OD" # backward-char
bindkey -M emacs -r "^[OF" # end-of-line
bindkey -M emacs -r "^[OH" # beginning-of-line
# bindkey -M emacs -r "^[Oc" # forward-word
# bindkey -M emacs -r "^[Od" # backward-word
bindkey -M emacs -r "^[P" # history-search-backward
bindkey -M emacs -r "^[Q" # push-line
bindkey -M emacs -r "^[S" # spell-word
bindkey -M emacs -r "^[T" # transpose-words
bindkey -M emacs -r "^[U" # up-case-word
bindkey -M emacs -r "^[W" # copy-region-as-kill
# bindkey -M emacs -r "^[[1;3C" # forward-word
# bindkey -M emacs -r "^[[1;3D" # backward-word
# bindkey -M emacs -r "^[[1;5C" # forward-word
# bindkey -M emacs -r "^[[1;5D" # backward-word
# bindkey -M emacs -r "^[[1~" # beginning-of-line
# bindkey -M emacs -r "^[[200~" # bracketed-paste
# bindkey -M emacs -r "^[[2~" # overwrite-mode
# bindkey -M emacs -r "^[[3~" # delete-char
# bindkey -M emacs -r "^[[4~" # end-of-line
bindkey -M emacs -r "^[[5~" # history-beginning-search-backward-end
bindkey -M emacs -r "^[[6~" # history-beginning-search-forward-end
bindkey -M emacs -r "^[[A" # history-search-backward
bindkey -M emacs -r "^[[B" # history-search-forward
bindkey -M emacs -r "^[[C" # forward-char
bindkey -M emacs -r "^[[D" # backward-char
# bindkey -M emacs -r "^[[F" # end-of-line
bindkey -M emacs -r "^[[H" # beginning-of-line
bindkey -M emacs -r "^[a" # accept-and-hold
# bindkey -M emacs -r "^[b" # backward-word
# bindkey -M emacs -r "^[c" # fzf-cd-widget
# bindkey -M emacs -r "^[d" # kill-word
bindkey -M emacs -r "^[e" # edit-command-line
# bindkey -M emacs -r "^[f" # forward-word
bindkey -M emacs -r "^[g" # get-line
# bindkey -M emacs -r "^[h" # insert-cycledright
bindkey -M emacs -r "^[i" # menu-complete
# bindkey -M emacs -r "^[l" # insert-cycledleft
bindkey -M emacs -r "^[m" # insert-last-typed-word
# bindkey -M emacs -r "^[n" # fzChDirOne
bindkey -M emacs -r "^[p" # history-search-backward
bindkey -M emacs -r "^[q" # push-line
bindkey -M emacs -r "^[s" # spell-word
# bindkey -M emacs -r "^[t" # transpose-words
# bindkey -M emacs -r "^[u" # cdUp
bindkey -M emacs -r "^[v" # slash-backward-kill-word
bindkey -M emacs -r "^[w" # copy-region-as-kill
bindkey -M emacs -r "^[x" # execute-named-cmd
bindkey -M emacs -r "^[y" # yank-pop
bindkey -M emacs -r "^[z" # execute-last-named-cmd
bindkey -M emacs -r "^[|" # vi-goto-column
# bindkey -M emacs -r "^[^?" # slash-backward-kill-word

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

# vi: ft=zsh:tw=0:sw=4:ts=4
