function fish_prompt --description 'Write out the prompt'
	#Save the return status of the previous command
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_red
        set -g __fish_color_red (set_color -o red)
    end

    if not set -q __fish_color_green
        set -g __fish_color_green (set_color -o green)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    if not set -q __fish_color_magenta
        set -g __fish_color_magenta (set_color -o magenta)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    # Replace $HOME with "~"
    set realhome ~
    set -l pwd (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

    # git prompt configuration
    set __fish_git_prompt_showupstream informative name
    set __fish_git_prompt_showstashstate 'yes'
    set __fish_git_prompt_color_branch yellow
    set __fish_git_prompt_color_upstream_ahead $__fish_color_green
    set __fish_git_prompt_color_upstream_behind $__fish_color_red

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

            if test "$stat" -ne 0
                printf '%s(%s) %s%s%s%s%s\f\r%s%s%s@%s %% ' "$__fish_color_status" "$stat" "$__fish_prompt_normal" "$__fish_prompt_cwd" "$pwd" "$__fish_color_magenta" (__fish_git_prompt) "$__fish_color_blue" $USER "$__fish_prompt_normal" (prompt_hostname)
            else
                printf '%s%s%s%s%s\f\r%s%s%s@%s %% ' "$__fish_prompt_normal" "$__fish_prompt_cwd" "$pwd" "$__fish_color_magenta" (__fish_git_prompt) "$__fish_color_blue" $USER "$__fish_prompt_normal" (prompt_hostname)
            end
    end
end
