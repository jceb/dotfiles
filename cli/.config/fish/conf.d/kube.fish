function __fzf_insert_kubecontext -d "Insert kube context after command"
    if ! set -q KUBECONFIG
        set KUBECONFIG "$HOME/.kube/config"
    end
    # set ctx (yq e '.contexts[].name' "$KUBECONFIG" | fzf)
    set ctx (yq e '.contexts[].name' "$KUBECONFIG" | sk)
    if test -n "$ctx"
        fish_commandline_append "--context=$ctx"
        # commandline -it -- $ctx
    end
    # commandline -f repaint
end
