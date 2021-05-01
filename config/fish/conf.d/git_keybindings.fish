# inspired by gitnow https://github.com/joseluisq/gitnow
bind -M insert \es 'echo; if git rev-parse HEAD >/dev/null 2>/dev/null; git st; end; commandline -f repaint'
bind -M insert \et 'echo; if git rev-parse HEAD >/dev/null 2>/dev/null; tig; end; commandline -f repaint'
bind -M insert \ex 'echo; if git rev-parse HEAD >/dev/null 2>/dev/null; tig status; end; commandline -f repaint'
bind -M insert \er 'echo; if git rev-parse HEAD >/dev/null 2>/dev/null; git pre; end; commandline -f repaint'
bind -M insert \ep 'echo; if git rev-parse HEAD >/dev/null 2>/dev/null; git push; end; commandline -f repaint'
bind -M insert \eg 'echo; if git rev-parse HEAD >/dev/null 2>/dev/null; git ls; end; commandline -f repaint'
