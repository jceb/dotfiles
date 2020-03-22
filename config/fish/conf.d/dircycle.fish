function __fish_dir_list
    ls
    echo
    commandline -f repaint
end

function __fish_dir_cycle_prev
    if test (count $dirprev) -gt 0
        prevd
        commandline -f repaint
    end
end

function __fish_dir_cycle_next
    if test (count $dirnext) -gt 0
        nextd
        commandline -f repaint
    end
end

function __fish_dir_cycle_up
    cd ..
    commandline -f repaint
end

function __fish_dir_cycle_warpDir
    set FILE
    if test -e "$HOME/.warprc"
        set FILE "$HOME/.warprc"
    else
        if test -e "$HOME/.cdargs"
            set FILE "$HOME/.cdargs"
        end
    end

    if test -n "$FILE"
        if not set -q FZF_TMUX_HEIGHT
            set FZF_TMUX_HEIGHT "40%"
        end
        set -x -l FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --height $FZF_TMUX_HEIGHT --reverse"
        command sed -ne 's/:/\\t/p' < "$FILE" | command fzf | command sed -ne "s/^[^\t]*\t//p" | read -l selection
        if test -d "$selection"
            cd "$selection"
        end
    end
    commandline -f repaint
end

function __fish_dir_cycle_fzChDir
    if not set -q FZF_TMUX_HEIGHT
        set FZF_TMUX_HEIGHT "40%"
    end
    set -x -l FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --height $FZF_TMUX_HEIGHT --reverse"
    set -l selection
    if type fd > /dev/null
        set -x FZF_DEFAULT_COMMAND 'command fd -d 4 -td -HIL'
        command fzf | read selection
    else
        command find -L . -mindepth 1 -maxdepth 4 \( -type d -o -type l \) ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/\* ! -wholename \*/.hg/\* 2>/dev/null | command fzf | read selection
    end
    if test -d "$selection"
        cd "$selection"
    end
    commandline -f repaint
end
