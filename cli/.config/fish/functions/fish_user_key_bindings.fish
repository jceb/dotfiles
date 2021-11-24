function fish_user_key_bindings
    # fish_vi_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Without an argument, fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase

    bind -M insert \cq __fzf_insert_kubecontext

    bind -M insert \cs __n

    bind -M insert \eu __fish_dir_cycle_up

    bind -M insert \eh __fish_dir_cycle_prev
    bind -M insert \el __fish_dir_cycle_next

    bind -M insert \ed __fish_list_current_token
    bind -M insert \em __fish_man_page
    bind -M insert \ei __fish_dir_list

    bind -e -M insert \ck # remove kill line binding
    bind -M insert \ck __fish_dir_cycle_warpDir

    bind -M insert \en __fish_dir_cycle_fzChDir

    ### fzf ###
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd --hidden'
        bind \cg '__fzf_open'
        bind \co '__fzf_open --editor'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd --hidden'
            bind -M insert \cg '__fzf_open'
            bind -M insert \co '__fzf_open --editor'
        end
    else
        bind \cf '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \eo '__fzf_cd'
        bind \eO '__fzf_cd --hidden'
        bind \cg '__fzf_open'
        bind \co '__fzf_open --editor'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \cf '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \eo '__fzf_cd'
            bind -M insert \eO '__fzf_cd --hidden'
            bind -M insert \cg '__fzf_open'
            bind -M insert \co '__fzf_open --editor'
        end
    end
    if set -q FZF_COMPLETE
        bind \t '__fzf_complete'
    end
    ### fzf ###
end

fzf_key_bindings
