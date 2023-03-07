# # Lists the files in a directory with the directories listed first.
# export def list [
#     directory : string = "."
#     --sort-by = "name" # Sort by column
#     --long (-l): bool = false # List all available columns for each entry
# ] {
#     $"ls -l"
#     ls $directory | where type == dir; or type == symlink; ($it.name | path expand | path type) == dir | if not ($in | empty?) { sort-by -i $sort-by }
#     | append (ls $directory | where type != dir; type != symlink; or ($it.name | path expand | path type) != dir | if not ($in | empty?) { sort-by -i $sort-by } else {[]})
#     # ls $directory | upsert isdir {|it| $it.name | path expand | path type} | sort-by isdir $sort-by | drop column 1
# }

export alias l = ls
export alias ll = ls
export alias lt = (ls | sort-by modified -r)
export alias ltr = (ls | sort-by modified)
export alias el = exa --group-directories-first --git -F
export alias elh = exa -lh
export alias ela = exa -lha
export alias ell = exa -l
export alias eltr = exa -l -smodified
export alias eltra = exa -laa -smodified

# quilt
export alias q++ = quilt push -a
export alias q+ = quilt push
export alias q-- = quilt pop -a
export alias q- = quilt pop
export alias q = quilt
export alias qD = quilt delete -r
export alias qa = quilt add
export alias qd = quilt diff
export alias qe = quilt new
export alias qp = quilt pop
export alias qr = quilt refresh
export alias qs = quilt series
export alias qt = quilt top

# git
export alias lg = EDITOR=nvim lazygit
export alias g+ = git stash pop
export alias g- = git stash
export alias gaa = git annex add
export alias gae = git annex edit
export alias gag = git annex get
export alias gaai = git annex init
export alias gaie = git aie
export alias gaii = git aii
export alias gan = git annex
export alias gas = git annex sync
export alias gass = git annex sync --content -A

export alias gbam = git bam
export alias gban = git ban
export alias gbc = git bc
export alias gbm = git bm
export alias gbr = git br
export alias gcam = git commit -v --amend
export alias gcb = git checkout -b
export alias gcob = git cob
export alias gd = git diff --no-prefix
export alias gdc = git diffc
export alias gdd = git difff
export alias gdw = git diff --no-prefix --word-diff
export alias ge = git edit
# export alias gf = git fetch; git log ...(git rev-parse --abbrev-ref @{upstream})
export alias gl = git log
# export alias glu = git log ..(git rev-parse --abbrev-ref @{upstream})
export alias gp = git push
# export alias gpf = git push -f
export alias gpm = git push -o merge_request.create -o merge_request.target=master
# export alias gpre = git pre
export alias gpt = git push --tags
export alias gpu = git push --set-upstream origin HEAD
export alias gpum = git push --set-upstream origin HEAD -o merge_request.create -o merge_request.remove_source_branch -o merge_request.assign=7 -o merge_request.target=master
export alias gr = git rebase
export alias gra = git rebase --abort
export alias grc = git rebase --continue
export alias gri = git rebase --interactive
export alias gs = git switch -
export alias gst = git st
export alias gsta = git sta
export alias gsuba = git submodule add
export alias gsubm = git subm
export alias gsubpre = git subpre
export alias gsubup = git subup
# export alias guc = git commit -m "Update changelogs"
# export alias gup = git up
export alias gu = git pull --rebase

# CD
export alias cd.. = cd ..
export alias cd. = cdx .git
export alias cdb = cdx base
export def-env cdx [searchdir] {
    mut nwd = $env.PWD
    while not ($"([$nwd, $searchdir] | path join)" | path exists) or $nwd == "/" {
        $nwd = ($nwd | path dirname)
    }
    if $nwd == "/" and (not ([$nwd $searchdir] | path join | path exists)) {
        return $"Staying in directory ($env.PWD)"
    }

    cd $nwd
}

# Kubernetes
# abbr --add kc 'kubectl auth can-i --as system:serviceaccount:cert-manager:cert-manager get configmaps -n kube-system'
# abbr --add ke 'kubectl exec -it -n dev POD -- /bin/sh'
# abbr --add kr 'kubectl run -it --rm -n dev --image=alpine:3 test -- /bin/sh'
export alias k = kubectl
export alias k9s = EDITOR=nvim ^k9s
export alias ka = kubectl apply
export alias kaf = kubectl apply -f
export alias kak = kubectl apply -k
export alias kb = kubectl describe --recursive=true
export alias kct = kubectl ctx
export alias kd = kubectl delete
export alias kg = kubectl get
export alias khard = EDITOR=nvim ^khard
export alias kk = kubectl kustomize
export alias kw = kubectl krew
export alias kx = kubectl explore

# Misc
export def psa [searchterm=""] {
    ps | where name =~ $searchterm
}

# npm install -g yo generator-standard-readme
export alias create-readme = yo standard-readme

export alias p = paru
export alias o = xdg-open

export alias ssh = TERM=xterm ^ssh

# interative grep
export alias rr = sk -i -c "rg -S --hidden -n -H {}"

export alias reload = source ~/.config/nushell/config.nu
export alias R = reload
# export alias reload = source $nu.config-path
# export def-env reload [] {
#     source $nu.config-path
# }

export def find-pod [image] {
    kubectl get pod -A -o json | from json | get items | filter {|it| $it.status.containerStatuses | any {|el| $el.image =~ $image} } | get metadata
}
