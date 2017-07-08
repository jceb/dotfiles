function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Without an argument, fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase

    bind -M insert \eu __fish_dir_cycle_up

    bind -M insert \eh __fish_dir_cycle_prev
    bind -M insert \el __fish_dir_cycle_next

    bind -M insert \ed __fish_list_current_token
    bind -M insert \em __fish_man_page

    bind -M insert \cb __fish_dir_cycle_warpDir

    bind -M insert \en __fish_dir_cycle_fzChDir

    ### fzf ###
    set -q FZF_LEGACY_KEYBINDINGS
    or set -l FZF_LEGACY_KEYBINDINGS 1
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \cx '__fzf_find_and_execute'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd_with_hidden'
        if bind -M insert >/dev/null ^/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \cx '__fzf_find_and_execute'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd_with_hidden'
        end
    else
        bind \cf '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ex '__fzf_find_and_execute'
        bind \ed '__fzf_cd'
        bind \eD '__fzf_cd_with_hidden'
        if bind -M insert >/dev/null ^/dev/null
            bind -M insert \cf '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ex '__fzf_find_and_execute'
            bind -M insert \ed '__fzf_cd'
            bind -M insert \eD '__fzf_cd_with_hidden'
        end
    end
    ### fzf ###
end

fzf_key_bindings
