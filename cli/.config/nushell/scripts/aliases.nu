# Lists the files in a directory with the directories listed first.
export def list [
    directory : string = "."
    --sort-by (-s): string = "name" # Sort by column
    --reverse (-r) # Sort in reverse order # FIXME: doesn't work yet
    --long (-l) # List all available columns for each entry # FIXME: doesn't work yet
] {
    ls $directory | if not ($in | is-empty) { where type == dir or type == symlink and ($in.name | path expand | path type) == dir | sort-by -i $sort_by } else {[]}
    | append (ls $directory | if not ($in | is-empty) {where type != dir and type != symlink or ($it.name | path expand | path type) != dir | sort-by -i $sort_by} else {[]})
    # ls $directory | upsert isdir {|it| $it.name | path expand | path type} | sort-by isdir $sort_by | drop column 1
}

export alias l = list
export alias ll = list
# export alias l = ls
export alias la = ls -a
export alias lsa = ls -a
export alias lla = ls -la
# export alias ll = ls
export def lt [directory: string = "."] {
  ls $directory | sort-by modified -r
}
# export alias lt = (ls | sort-by modified -r)
export def ltr [directory: string = "."] {
  list --sort-by modified $directory
}
# export alias ltr = (ls | sort-by modified)
export alias el = ^exa --group-directories-first --git -F
export alias elh = ^exa -lh
export alias ela = ^exa -lha
export alias ell = ^exa -l
export alias eltr = ^exa -l -smodified
export alias eltra = ^exa -laa -smodified

export def flux-status [] {
 flux get source git -A
 flux get kustomizations -A
 flux get helmrelease -A
}

# quilt
export alias q++ = ^quilt push -a
export alias q+ = ^quilt push
export alias q-- = ^quilt pop -a
export alias q- = ^quilt pop
export alias q = ^quilt
export alias qD = ^quilt delete -r
export alias qa = ^quilt add
export alias qd = ^quilt diff
export alias qe = ^quilt new
export alias qp = ^quilt pop
export alias qr = ^quilt refresh
export alias qs = ^quilt series
export alias qt = ^quilt top

# ^git
# export alias lg = EDITOR=nvim lazygit
# export def lg [] {
#   EDITOR=nvim lazygit
# }
export alias lg = ^lazygit
export alias g+ = ^git stash pop
export alias g- = ^git stash
export alias gaa = ^git annex add
export alias gae = ^git annex edit
export alias gag = ^git annex get
export alias gaai = ^git annex init
export alias gaie = ^git aie
export alias gaii = ^git aii
export alias gan = ^git annex
export alias gas = ^git annex sync
export alias gass = ^git annex sync --content -A

export alias ga = ^git add
export alias gb = ^git branch
export alias gba = ^git ba
export alias gbam = ^git bam
export alias gban = ^git ban
export alias gbc = ^git bc
export alias gbm = ^git bm
export alias gbr = ^git br
export alias gc = ^git commit
export alias gcam = ^git commit -v --amend
export alias gca = ^git commit -a
export alias gcb = ^git checkout -b
export alias gcob = ^git cob
export alias gco = ^git checkout
export alias gd = ^git diff --no-prefix
export alias gdc = ^git diffc
export alias gdd = ^git difff
export alias gdw = ^git diff --no-prefix --word-diff
export alias ge = ^git edit
# export alias gf = ^git fetch; ^git log ...(^git rev-parse --abbrev-ref @{upstream})
export alias gl = ^git log
# export alias glu = ^git log ..(^git rev-parse --abbrev-ref @{upstream})
export alias gp = ^git push
# export alias gpf = ^git push -f
export alias gpm = ^git push -o merge_request.create -o merge_request.target=master
export alias gpme = ^git push --set-upstream origin HEAD -o merge_request.create -o merge_request.remove_source_branch -o merge_request.assign=7 -o merge_request.target=master
# export alias gpre = ^git pre
export alias gpt = ^git push --tags
export alias gpu = ^git push upstream HEAD
export alias gr = ^git rebase
export alias grv = ^git remote -v
export alias gra = ^git rebase --abort
export alias grc = ^git rebase --continue
export alias gri = ^git rebase --interactive
export alias gss = ^git switch -
export alias gst = ^git st
export alias gsta = ^git sta
export alias gsuba = ^git submodule add
export alias gsubm = ^git subm
export alias gsubpre = ^git subpre
export alias gsubup = ^git subup
# export alias guc = ^git commit -m "Update changelogs"
# export alias gup = ^git up
export alias gu = ^git pull --rebase
export alias guu = ^git pull upstream HEAD

# CD
export alias cd.. = cd ..
export def --env cdx [searchdir] {
    mut nwd = $env.PWD
    while not ($"([$nwd, $searchdir] | path join)" | path exists) or $nwd == "/" {
        $nwd = ($nwd | path dirname)
    }
    if $nwd == "/" and (not ([$nwd $searchdir] | path join | path exists)) {
        return $"Staying in directory ($env.PWD)"
    }

    cd $nwd
}
export alias cd. = cdx .git
export alias cdb = cdx base

# Kubernetes
# abbr --add kc 'kubectl auth can-i --as system:serviceaccount:cert-manager:cert-manager get configmaps -n kube-system'
# abbr --add ke 'kubectl exec -it -n dev POD -- /bin/sh'
# abbr --add kr 'kubectl run -it --rm -n dev --image=alpine:3 test -- /bin/sh'
export alias k = kubectl
export def gist [...args] {
  ^gh gist $args
}
# export def k9s [--context: string = "", ...args] {
#   if $context == "" {
#     EDITOR=nvim ^k9s $args
#   } else {
#     EDITOR=nvim ^k9s --context $context $args
#   }
# }
export alias ka = kubectl apply
export alias kaf = kubectl apply -f
export alias kak = kubectl apply -k
export alias kb = kubectl describe --recursive=true
export alias kct = kubectl ctx
export alias kd = kubectl delete
export alias kg = kubectl get
# export alias khard = EDITOR=nvim ^khard
# export def khard [-a: string = "", ...args] {
#   if ($a) {
#     EDITOR=nvim ^khard -a $a $args
#   } else {
#     EDITOR=nvim ^khard $args
#   }
# }
export alias kk = kubectl kustomize
export alias kw = kubectl krew
export alias kx = kubectl explore

# export alias colors-load = source ~/.config/nushell/config.nu
# export def colors-load {
#   source ~/.config/nushell/config.nu
# }

export def nix-init [] {
  if (".flake" | path exists) {
    print -e "ERROR: .flake directory already exists"
    exit 1
  }
  "# Documentation: https://direnv.net/man/direnv-stdlib.1.html
source_up_if_exists
dotenv_if_exists

use flake .flake
" | save .envrc
  mkdir .flake
  cp ~/.config/templates/flake.nix .flake
  git add .flake
  cd .flake
  nix flake update
  print "Initialization done."
  print "1. Add custom packages to .flake/flake.nix"
  print "2. Update packages with `cd .flake; nix flake update`"
  print "3. Allow direnv: direnv allow ."
}

export def nix-clean [] {
  print -e "^find -H /nix/var/nix/gcroots/auto -type l | xargs -I {} sh -c 'readlink {}' | grep jceb | xargs rm -v"
  print -e "sudo nix-collect-garbage -d"
  print -e "# run as normal user to remove generations form the user's profile"
  print -e "nix-collect-garbage -d"
  print -e "sudo nix-store --optimise"
  print -e "sudo nix-store --verify --check-contents --repair"
}

# Misc
export def psa [searchterm=""] {
    ps -l | where name =~ $searchterm | select user_id pid start_time status command
}

# npm install -g yo generator-standard-readme
export alias create-readme = yo standard-readme

# export alias o = xdg-open
export alias o = open-cli

# # export alias ssh = TERM=xterm ^ssh
# export def ssh [] {
#   TERM=xterm ^ssh
# }

# interative grep
export alias rr = sk -i -c "rg -S --hidden -n -H {}"

export def find-pod [image] {
    kubectl get pod -A -o json | from json | get items | filter {|it| $it.status.containerStatuses | any {|el| $el.image =~ $image} } | get metadata
}
