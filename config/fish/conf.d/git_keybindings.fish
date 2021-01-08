# inspired by gitnow https://github.com/joseluisq/gitnow
bind -M insert \es 'echo; if git st; commandline -f repaint; else; end'
bind -M insert \et 'echo; if tig; commandline -f repaint; else; end'
bind -M insert \ex 'echo; if tig status; commandline -f repaint; else; end'
bind -M insert \er 'echo; if git pre; commandline -f repaint; else; end'
bind -M insert \ep 'echo; if git push; commandline -f repaint; else; end'
bind -M insert \eg 'echo; if git ls; commandline -f repaint; else; end'
