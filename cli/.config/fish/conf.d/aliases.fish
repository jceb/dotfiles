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


abbr --add o 'xdg-open'
abbr --add open 'xdg-open'

abbr --add n __n

# on debian based systems this makes the use of ack a bit easier
if test -e /usr/bin/ack-grep
    abbr --add ack 'ack-grep'
end

# abbr --add t 'tree -f'
abbr --add t 'exa -T'

abbr --add top 'htop'

abbr --add c 'khard'
abbr --add h 'cht.sh'
abbr --add r 'rg'
abbr --add ru 'rg -uuu'

abbr --add k 'kubectl'
abbr --add kd 'kubectl delete -f'
abbr --add kdk 'kubectl delete -k'
abbr --add ka 'kubectl apply -f'
abbr --add kak 'kubectl apply -k'
abbr --add kk 'kubectl kustomize'
abbr --add kc 'kubectl auth can-i --as system:serviceaccount:cert-manager:cert-manager get configmaps -n kube-system'

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
abbr --add g 'git'
abbr --add g+ 'git stash pop'
abbr --add g- 'git stash'
abbr --add ga 'git add'
abbr --add gaa 'git annex add'
abbr --add gae 'git annex edit'
abbr --add gag 'git annex get'
abbr --add gai 'git annex init'
abbr --add gaie 'git aie'
abbr --add gaii 'git aii'
abbr --add gan 'git annex'
abbr --add gas 'git annex sync'
abbr --add gass 'git annex sync --content'
abbr --add gau 'git add -u'
abbr --add gb 'git branch'
abbr --add gba 'git ba'
abbr --add gbam 'git bam'
abbr --add gbc 'git bc'
abbr --add gbm 'git bm'
abbr --add gbr 'git bc'
abbr --add gc 'git commit'
abbr --add gca 'git commit -a'
abbr --add gcam 'git commit --amend'
abbr --add gci 'git ci'
abbr --add gco 'git checkout'
abbr --add gcob 'git cob'
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
abbr --add gpm 'git push -o merge_request.create -o merge_request.target=master'
abbr --add gpre 'git pre'
abbr --add gpt 'git push --tags'
abbr --add gpu 'git push --set-upstream origin HEAD'
abbr --add grm 'git rm'
abbr --add gst 'git st'
abbr --add gsta 'git sta'
abbr --add gsuba 'git submodule add'
abbr --add gsubm 'git subm'
abbr --add gsubpre 'git subpre'
abbr --add gsubup 'git subup'
abbr --add guc 'git commit -m "Update changelogs"'
abbr --add gup 'git up'

abbr --add p 'paru'

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
    rg -S --hidden -n -H $argv | fzf -0 -m
end

# function f -d 'find for files'
#     fd -tf $argv | fzf -0 -m
# end

abbr --add f 'faas-cli'

function d -d 'find for directories'
    fd -td $argv | fzf -0 -m
end

function = -d 'zsh like shortcut to the which command'
    which $argv
end

# vi: ft=fish:tw=0:sw=4:ts=4
