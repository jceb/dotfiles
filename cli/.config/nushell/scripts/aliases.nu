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

# export alias l = list
export alias lt = (ls | sort-by modified -r | sort-by type)
export alias l = exa --group-directories-first --git -F
export alias lh = l -lh
export alias la = l -lha
export alias ll = l -l
export alias ltr = l -l -smodified
# export alias ltr = list --sort-by "modified"
export alias ltra = l -laa -smodified

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
export alias g = git
export alias g+ = git stash pop
export alias g- = git stash
export alias ga = git add
export alias gaa = git annex add
export alias gae = git annex edit
export alias gag = git annex get
export alias gaai = git annex init
export alias gaie = git aie
export alias gaii = git aii
export alias gan = git annex
export alias gas = git annex sync
export alias gass = git annex sync --content -A
export alias gau = git add -u
export alias gb = git branch
export alias gba = git ba
export alias gbam = git bam
export alias gban = git ban
export alias gbc = git bc
export alias gbm = git bm
export alias gbr = git br
export alias gc = git commit
export alias gca = git commit -a
export alias gcam = git commit --amend
export alias gco = git checkout
export alias gcb = git checkout -b
export alias gcob = git cob
export alias gcs = git commit --sign-of
export alias gd = git diff --no-prefix
export alias gdc = git diffc
export alias gdd = git difff
export alias gdw = git diff --no-prefix --word-diff
export alias ge = git edit
# export alias gf = git fetch; git log ...(git rev-parse --abbrev-ref @{upstream})
export alias gl = git log
# export alias glu = git log ..(git rev-parse --abbrev-ref @{upstream})
export alias gm = git merge
export alias gp = git push
export alias gpf = git push -f
export alias gpm = git push -o merge_request.create -o merge_request.target=master
export alias gpre = git pre
export alias gpt = git push --tags
export alias gpu = git push --set-upstream origin HEAD
export alias gpum = git push --set-upstream origin HEAD -o merge_request.create -o merge_request.remove_source_branch -o merge_request.assign=7 -o merge_request.target=master
export alias gr = git rebase
export alias gra = git rebase --abort
export alias grc = git rebase --continue
export alias gri = git rebase --interactive
export alias grm = git rm
export alias gs = git switch -
export alias gst = git st
export alias gsta = git sta
export alias gsuba = git submodule add
export alias gsubm = git subm
export alias gsubpre = git subpre
export alias gsubup = git subup
export alias gsw = git switch -
export alias guc = git commit -m "Update changelogs"
export alias gup = git up
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

export alias p = paru
export alias reload = source ~/.config/nushell/config.nu
# export alias reload = source $nu.config-path
