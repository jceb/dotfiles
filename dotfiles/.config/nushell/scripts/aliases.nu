# Lists the files in a directory, directories are listed first.
export def list [
    dir: string = "."
    --sort-by (-s): string = "name" # Sort by column
    --reverse (-r) # Reverse sort order
    --all (-a) # Show hidden files
    --long (-l) # Get all available columns for each entry (slower; columns are platform-dependent)
    --full-paths (-f) # display paths as absolute paths
    --du (-d) # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D) # List the specified directory itself instead of its contents
    --mime-type (-m) # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t) # Use multiple threads to list contents. Output will be non-deterministic.
] {
    ls --all=$all --long=$long --full-paths=$full_paths --du=$du --directory=$directory --mime-type=$mime_type --threads=$threads $dir | sort-by -c {|a, b|
      if ($a.type == "dir") {
        if ($b.type == "dir") {
          # print $"($a.name) ($b.name): ($a.name < $b.name)"
          if $reverse {
            ($a | get $sort_by) > ($b | get $sort_by)
          } else {
            ($a | get $sort_by) < ($b | get $sort_by)
          }
        } else {
          # if a is a directory, then it's sorted before b
          true
        }
      } else if ($b.type == "dir") {
        # if b is a directory, then it's sorted before a
        false
      } else {
        # print $"($a.name) ($b.name): ($a.name < $b.name)"
        if $reverse {
          ($a | get $sort_by) > ($b | get $sort_by)
        } else {
          ($a | get $sort_by) < ($b | get $sort_by)
        }
      }
    }
}

export alias l = list
export alias ll = list
export alias la = list -a
export alias lsa = list -a
export alias lla = list -la
export def lt [dir: string = "."] {
  # ls $dir | sort-by modified -r
  list --sort-by modified $dir
}
# export alias lt = (ls | sort-by modified -r)
export def ltr [dir: string = "."] {
  list -r --sort-by modified $dir
}
# export alias ltr = (ls | sort-by modified)
export alias el = ^exa --group-directories-first --git -F
export alias elh = ^exa -lh
export alias ela = ^exa -lha
export alias ell = ^exa -l
export alias eltr = ^exa -l -smodified
export alias eltra = ^exa -laa -smodified
# export alias t = ^exa -T --absolute
export alias t = ^tree -f --gitignore

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
export alias j = ^jj
export alias ja = ^jj abandon
export alias jb = ^jj bookmark
export alias jbc = ^jj bookmark create -r @-
export alias jbl = ^jj bookmark list
export alias jbs = ^jj bookmark set
export alias jbt = ^jj bookmark track
export alias jc = ^jj commit
export alias jci = ^jj commit --interactive
export alias jd = ^jj diff
export alias jde = ^jj desc
export alias jdm = ^jj diff-main
export alias je = ^jj edit
export alias jf = ^jj file
export alias jg = ^jj git
export alias jgf = ^jj git fetch
export alias jp = ^jj git push
export alias jgp = ^jj git push
export alias jgu = ^jj git fetch
export alias ju = ^jj git fetch
export alias jl = ^jj log
export alias jll = ^jj log -r ::@
export alias jla = ^jj log -r ::
export alias jlt = ^jj log -r 'tags() | bookmarks()'
export alias jlh = ^jj log -r 'heads(all())'
export alias jls = ^jj file list
export alias jn = ^jj new
export alias jr = ^jj rebase
export alias jrm = ^jj rebase-main
export alias js = ^jj show
export alias jsp = ^jj split
export alias jsq = ^jj squash
export alias jss = ^jj squash
export alias jsi = ^jj squash --interactive
export alias jtg = ^jj tug
export alias jtug = ^jj tug
export alias jt = ^jj tag
export def jjignore [
  --force (-f)
  # Overwrite existing exclude file
]: nothing -> nothing {
  let root = jj root
  let gitignore = [$root .gitignore] | path join
  let gitexclude = [$root .git info exclude] | path join
  if ($gitignore | path exists) {
    if ($gitexclude | path exists) {
      if  $force {
        print -e "Original file contents:"
        print -e (open --raw $gitexclude)
        cp -v $gitignore $gitexclude
      } else {
        print -e "File contents:"
        print -e (open --raw $gitexclude)
        error make {msg: $"File exists: ($gitignore)"}
      }
    } else {
      cp -v $gitignore $gitexclude
    }
  } else {
    error make {msg: $"File doesn't exist: ($gitignore)"}
  }
}
export alias jignore = jjignore

export alias lj = ^lazyjj
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
# Searches up the directory tree, starting with the parent directory of the current directory, for a directory that that
# contains any of the files and changes the current directory to this directory. If no such directory is found, the
# current directory stays unchanged.
export def --env cdx [...files] {
  mut next_wd = $env.PWD | path dirname
  def existInPath [cwd: string] {
    any {|file| $cwd | path join $file | path exists }
  }
  while not ($files | existInPath $next_wd) and $next_wd != "/" {
    $next_wd = $next_wd | path dirname
  }
  if $next_wd == "/" and (not ($files | existInPath $next_wd)) {
    print -e $"Unable to locate directory with any of these files: ($files | str join ', ').\nStaying in directory ($env.PWD)"
    return
  }
  cd $next_wd
}
export alias cd. = cdx .jj .git Cargo.toml packages.json deno.json deno.jsonc flake.nix
export alias cdb = cdx base
export alias cdg = cdx .git .jj
export alias cdj = cdx packages.json deno.json deno.jsonc
export alias cdn = cdx flake.nix
export alias cdr = cdx Cargo.toml

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
    kubectl get pod -A -o json | from json | get items | where {|it| $it.status.containerStatuses | any {|el| $el.image =~ $image} } | get metadata
}
