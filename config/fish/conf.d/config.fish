set -x VISUAL nvim
set -x EDITOR vim

# cursor shape set by fish_vi_cursor
set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_visual block
set -g fish_escape_delay_ms 10

# hide greeting
set fish_greeting ""

starship init fish | source
