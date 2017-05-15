if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
end

if not set -q __fish_color_red
    set -g __fish_color_red (set_color -o red)
end

if not set -q __fish_color_green
    set -g __fish_color_green (set_color -o green)
end

if not set -q __fish_color_yellow
    set -g __fish_color_yellow (set_color yellow)
end

if not set -q __fish_color_blue
    set -g __fish_color_blue (set_color -o blue)
end

if not set -q __fish_color_magenta
    set -g __fish_color_magenta (set_color magenta)
end

# git prompt configuration
set -U __fish_git_prompt_char_dirtystate '⚡'
set -U __fish_git_prompt_char_stagedstate '→'
set -U __fish_git_prompt_char_stashstate '↩'
set -U __fish_git_prompt_char_untrackedfiles '☡'
set -U __fish_git_prompt_char_upstream_ahead '+'
set -U __fish_git_prompt_char_upstream_behind '-'
set -U __fish_git_prompt_color_branch yellow
set -U __fish_git_prompt_color_dirtystate red
set -U __fish_git_prompt_color_flags blue
set -U __fish_git_prompt_color_stagedstate green
set -U __fish_git_prompt_color_upstream magenta
set -U __fish_git_prompt_color_upstream_ahead $__fish_color_green
set -U __fish_git_prompt_color_upstream_behind $__fish_color_red
set -U __fish_git_prompt_showstashstate 'yes'
set -U __fish_git_prompt_showupstream 'verbose' 'name'

function fish_prompt --description 'Write out the prompt'
    #Save the return status of the previous command
    set stat $status

    # Replace $HOME with "~"
    set realhome ~
    set -l pwd (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    switch $USER

    case root toor

        if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end

        printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

    case '*'

        if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end

        set git_prompt (__fish_git_prompt)
        if test "$stat" -ne 0
            printf '%s(%s) %s%s%s%s%s\n%s%s%s@%s %% ' "$__fish_color_status" "$stat" "$__fish_prompt_normal" "$__fish_prompt_cwd" "$pwd" "$__fish_color_magenta" "$git_prompt" "$__fish_color_blue" "$USER" "$__fish_prompt_normal" (prompt_hostname)
        else
            printf '%s%s%s%s%s\n%s%s%s@%s %% ' "$__fish_prompt_normal" "$__fish_prompt_cwd" "$pwd" "$__fish_color_magenta" "$git_prompt" "$__fish_color_blue" "$USER" "$__fish_prompt_normal" (prompt_hostname)
        end
    end
end
