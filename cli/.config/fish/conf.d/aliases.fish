# ignore ~/.ssh/known_hosts entries
function issh
    command ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -o "PreferredAuthentications=keyboard-interactive" $argv
end

abbr --add dockeri 'docker run --rm -i -t'

# defaults
function grep
    command grep --color=auto --exclude=\*.svn-base --exclude=\*\~ --exclude=\*.tmp --binary-files=without-match $argv
end

function rg
    command rg -i $argv
end

function any
    command ps aux | rg $argv
end

function __n
    VISUAL=vim _n -Q
end


abbr --add o 'open'
# abbr --add open 'xdg-open'

abbr --add n __n

# on debian based systems this makes the use of ack a bit easier
if test -e /usr/bin/ack-grep
    abbr --add ack 'ack-grep'
end

# abbr --add t 'tree -f'
abbr --add t 'exa -T'
abbr --add cl 'curlie -f'

abbr --add top 'htop'

abbr --add c 'khard'
abbr --add h 'cht.sh'
abbr --add r 'rg'
abbr --add ru 'rg -uuu'

abbr --add k 'kubectl'
abbr --add ka 'kubectl apply -f'
abbr --add kak 'kubectl apply -k'
abbr --add kb 'kubectl describe --recursive=true'
abbr --add kc 'kubectl auth can-i --as system:serviceaccount:cert-manager:cert-manager get configmaps -n kube-system'
abbr --add kct 'kubectl ctx'
abbr --add kd 'kubectl delete -f'
abbr --add kdk 'kubectl delete -k'
# abbr --add ke 'kubectl exec POD -- CMD'
abbr --add ke 'kubectl exec --stdin=true --tty=true POD -n namespace -- CMD'
abbr --add kg 'kubectl get'
abbr --add kk 'kubectl kustomize'
abbr --add kr 'kubectl run -it -n namespace --image=IMG POD -- CMD'
abbr --add kre 'kubectl krew'
abbr --add kx 'kubectl explore'
abbr --add k9s 'EDITOR=nvim k9s'

# # calendar and contacts abbreviations
# abbr --add cal 'khal'
# abbr --add agenda 'khal agenda'

# ls
function ls
    # command ls -b -CF --file-type --color=auto --group-directories-first $argv
    command exa --group-directories-first --git -F $argv
end
abbr --add la 'ls -laa'
abbr --add ltr 'ls -l -smodified'
# abbr --add ltr 'ls -ltr'
abbr --add ltra 'ls -laa -smodified'
# abbr --add ltra 'ls -ltra'
abbr --add l 'ls -l'
abbr --add ll 'ls -l'
abbr --add lh 'ls -lh'

# create various things

function create-readme
    # install: yarn global add yo generator-standard-readme
    command yo standard-readme $argv
end

# quilt
abbr --add q++ 'quilt push -a'
abbr --add q+ 'quilt push'
abbr --add q-- 'quilt pop -a'
abbr --add q- 'quilt pop'
abbr --add q 'quilt'
abbr --add qD 'quilt delete -r'
abbr --add qa 'quilt add'
abbr --add qd 'quilt diff'
abbr --add qe 'quilt new'
abbr --add qp 'quilt pop'
abbr --add qr 'quilt refresh'
abbr --add qs 'quilt series'
abbr --add qt 'quilt top'

# git

# forgit:
# Interactive git add selector (ga)
set forgit_add gai
# Interactive git log viewer (glo)
# Interactive .gitignore generator (gi)
# Interactive git diff viewer (gd)
set forgit_diff gdi
# Interactive git reset HEAD <file> selector (grh)
# Interactive git checkout <file> selector (gcf)
# Interactive git checkout <branch> selector (gcb)
# Interactive git checkout <commit> selector (gco)
set forgit_checkout_commit gcoi
# Interactive git stash viewer (gss)
# Interactive git clean selector (gclean)
# Interactive git cherry-pick selector (gcp)
# Interactive git rebase -i selector (grb)
# Interactive git commit --fixup && git rebase -i --autosquash selector (gfu)

abbr --add lg 'EDITOR=nvim lazygit'
abbr --add g 'git'
abbr --add g+ 'git stash pop'
abbr --add g- 'git stash'
abbr --add ga 'git add'
abbr --add gaa 'git annex add'
abbr --add gae 'git annex edit'
abbr --add gag 'git annex get'
abbr --add gaai 'git annex init'
abbr --add gaie 'git aie'
abbr --add gaii 'git aii'
abbr --add gan 'git annex'
abbr --add gas 'git annex sync'
abbr --add gass 'git annex sync --content -A'
abbr --add gau 'git add -u'
abbr --add gb 'git branch'
abbr --add gba 'git ba'
abbr --add gbam 'git bam'
abbr --add gban 'git ban'
abbr --add gbc 'git bc'
abbr --add gbm 'git bm'
abbr --add gbr 'git br'
abbr --add gc 'git commit'
abbr --add gca 'git commit -a'
abbr --add gcam 'git commit --amend'
abbr --add gco 'git checkout'
abbr --add gcb 'git checkout -b'
abbr --add gcob 'git cob'
abbr --add gcs 'git commit --sign-of'
abbr --add gd 'git diff --no-prefix'
abbr --add gdc 'git diffc'
abbr --add gdd 'git difff'
abbr --add gdw 'git diff --no-prefix --word-diff'
abbr --add ge 'git edit'
abbr --add gf 'git fetch; and git log ...(git rev-parse --abbrev-ref @\{upstream\})'
abbr --add gl 'git log'
abbr --add glu 'git log ..(git rev-parse --abbrev-ref @\{upstream\})'
abbr --add gm 'git merge'
abbr --add gp 'git push'
abbr --add gpf 'git push -f'
abbr --add gpm 'git push -o merge_request.create -o merge_request.target=master'
abbr --add gpre 'git pre'
abbr --add gpt 'git push --tags'
abbr --add gpu 'git push --set-upstream origin HEAD'
abbr --add gpum 'git push --set-upstream origin HEAD -o merge_request.create -o merge_request.remove_source_branch -o merge_request.assign=7 -o merge_request.target=master'
abbr --add gr 'git rebase'
abbr --add gra 'git rebase --abort'
abbr --add grc 'git rebase --continue'
abbr --add gri 'git rebase --interactive'
abbr --add grm 'git rm'
abbr --add gs 'git switch -'
abbr --add gst 'git st'
abbr --add gsta 'git sta'
abbr --add gsuba 'git submodule add'
abbr --add gsubm 'git subm'
abbr --add gsubpre 'git subpre'
abbr --add gsubup 'git subup'
abbr --add gsw 'git switch -'
abbr --add guc 'git commit -m "Update changelogs"'
abbr --add gup 'git up'

abbr --add gu 'gitui'

abbr --add p 'paru'

abbr --add ssh 'TERM=xterm ssh'

function _ch2root --description "jump to the next parent directory containing a subdirectory that's passed via argv"
    set _d $PWD
    while test $_d != "/"
        for _dir in $argv
            if test -d {$_d}/{$_dir}
                echo "Found '$_dir' directory at: $_d" >&2
                echo $_d
                return
            end
        end
        set _d (dirname $_d)
    end
    echo "Directory not found in parent directories: "$argv >&2
    return
end

abbr --add cd. 'cd (_ch2root debian .git .hg .svn package.json)'
abbr --add cdroot 'cd (_ch2root debian .git .hg .svn package.json)'

abbr --add cd.. 'cd ..'

function r -d 'grep replacement'
    # rg -S --hidden -n -H $argv | fzf -0 -m
    rg -S --hidden -n -H $argv | sk -m
end

function rr -d 'interactive grep'
    # rg -S --hidden -n -H $argv | fzf -0 -m
    sk -i -c "rg -S --hidden -n -H {}"
end


# function f -d 'find for files'
#     fd -tf $argv | fzf -0 -m
# end

abbr --add f 'faas-cli'

function d -d 'find for directories'
    # fd -td $argv | fzf -0 -m
    fd -td $argv | sk
end

function = -d 'zsh like shortcut to the which command'
    which $argv
end

# vi: ft=fish:tw=0:sw=4:ts=4
