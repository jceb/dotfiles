# ignore ~/.ssh/known_hosts entries
function issh
    command ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -o "PreferredAuthentications=keyboard-interactive" $argv
end

abbr --add dockeri="docker run --rm -i -t"

# defaults
function grep
    command grep --color=auto --exclude=\*.svn-base --exclude=\*\~ --exclude=\*.tmp --binary-files=without-match $argv
end

function rg
    command rg -i $argv
end

abbr --add 'o=xdg-open'
abbr --add 'open=xdg-open'

# on debian based systems this makes the use of ack a bit easier
if test -e /usr/bin/ack-grep
    abbr --add ack=ack-grep
end
abbr --add 't=tree -f'

abbr --add 'cal=khal'
abbr --add 'agenda=khal agenda'
abbr --add 'contacts=khard'

# ls
function ls
    command ls -b -CF --file-type --color=auto --group-directories-first $argv
end
abbr --add 'ltr=ls -ltr'
abbr --add 'ltra=ls -ltra'
function l
    ls -l $argv
end
function ll
    ls -l $argv
end

# quilt
abbr --add 'q=quilt'
abbr --add 'qa=quilt add'
abbr --add 'qd=quilt diff'
abbr --add 'q++=quilt push -a'
abbr --add 'q+=quilt push'
abbr --add 'q--=quilt pop -a'
abbr --add 'q-=quilt pop'
abbr --add 'qr=quilt refresh'
abbr --add 'qs=quilt series'

# git
abbr --add 'g=git'
abbr --add 'g+=git stash pop'
abbr --add 'g-=git stash'
abbr --add 'ga=git add'
abbr --add 'gau=git add -u'
abbr --add 'gb=git branch'
abbr --add 'gba=git ba'
abbr --add 'gbc=git bc'
abbr --add 'gbm=git bm'
abbr --add 'gbam=git bam'
abbr --add 'gbr=git bc'
abbr --add 'gc=git commit'
abbr --add 'gca=git commit -a'
abbr --add 'guc=git commit -m "Update changelogs"'
abbr --add 'gcmsg=git commit --amend'
abbr --add 'gco=git checkout'
abbr --add 'gd=git diff --no-prefix'
abbr --add 'gdw=git diff --no-prefix --word-diff'
abbr --add 'gdc=git diffc'
abbr --add 'gdd=git difff'
abbr --add 'ge=git edit'
abbr --add 'gp=git push'
abbr --add 'gpre=git pre'
abbr --add 'gst=git st'
abbr --add 'gsta=git sta'
abbr --add 'gsubpre=git subpre'
abbr --add 'gsubm=git subm'
abbr --add 'gsubup=git subup'
abbr --add 'gci=git ci'
abbr --add 'gup=git up'

function _chdir --description 'aliases for quickly traversing through the Univention SVN'
    if echo $PWD | grep -q '/trunk/'
        cd (echo $PWD | sed -e "s#/trunk/#/branches/ucs-"$argv[1]"#")
    else
        cd (echo $PWD | sed -e "s#/branches/ucs-[0-9.]*#/branches/ucs-"$argv[1]"#")
    end
end

abbr --add 'cdt=cd $(echo $(pwd)/|sed -e "s#/branches/ucs-[^/]*/#/trunk/#")'
abbr --add 'cdb2=_chdir 2.0'
abbr --add 'cdb21=_chdir 2.1'
abbr --add 'cdb22=_chdir 2.2'
abbr --add 'cdb23=_chdir 2.3'
abbr --add 'cdb24=_chdir 2.4'
abbr --add 'cdb3=_chdir 3.0'
abbr --add 'cdb31=_chdir 3.1'
abbr --add 'cdb32=_chdir 3.2'
abbr --add 'cdb33=_chdir 3.3'
abbr --add 'cdb4=_chdir 4.0'
abbr --add 'cdb41=_chdir 4.1'
abbr --add 'cdb42=_chdir 4.2'
abbr --add 'cdb43=_chdir 4.3'
abbr --add 'cdb5=_chdir 5.0'
abbr --add 'cdd=_chdir'

function _ch2parentdir --description 'jump to the next parent directory containing a subdirectory that\'s passed via $argv'
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

abbr --add 'cd.=cd (_ch2parentdir debian .git .hg .svn)'

function _glob_match --description 'aliases for quickly traversing through the directory structures'
    # $1: pattern; $2: term
    switch "$2"
        case '*'$1'*'
            return 0
        case '*'
            return 1
    end
end

function _seldir
    # $1 direction: -1: backward, 0: unlimited forward: >0: limited forward; $2 filter
    set _depth $argv[1]
    if test (count $argv) -eq 1
        set _filter ''
        set _delfirst "1d;"
    else
        set _filter $argv[2]
        set _delfirst ""
    end
    set _maxdepth "-maxdepth"

    # find directories
    if test $_depth -eq -1
        # traverse backward
        set _dirs
        set _d $PWD
        while test $_d != "/"
            set _d (dirname $_d)
            if string match -q '*'$_filter'*' (basename $_d)
                set _dirs $_dirs $_d
            end
        end
    else
        # traverse forward
        if test $_depth -eq 0
            set _depth ""
            set _maxdepth ""
        end
        set _dirs (find -L . $_maxdepth $_depth -type d -iname "*"$_filter"*" ! -wholename \*/debian/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e $_delfirst"s/^\.\///"|sort)
    end

    # select directory and change into it
    if test (count $_dirs) -ge 1
        if test (count $_dirs) -eq 1
            cd $_dirs
        else
            for i in (seq (count $_dirs))
                echo "$i $_dirs[$i]"
            end
            echo -n "which one? " >&2
            read _d
            if test $_d -le (count $_dirs); and test $_d -ge 1
                cd "$_dirs[$_d]"
            end
        end
    end
end

abbr --add 'cd-=_seldir -1'
abbr --add 'cd+=_seldir 0'
abbr --add 'cd1=_seldir 1'
abbr --add 'cd2=_seldir 2'
abbr --add 'cd3=_seldir 3'
abbr --add 'cd..=cd ..'

# handy functions for searching files and directories
function _find_objects
    # $1: find directories "" or not "!"; $2: search pattern or search directory if $3 is specified; $3: if sepcified: search pattern
    set _finddirs $argv[1]
    set -e argv[1]
    set _dirs
    while test (count $argv) -ne 0
        if test -d $argv[1]
            set _dirs $_dirs $argv[1]
            set -e argv[1]
            continue
        else
            break
        end
    end
    if test (count $_dirs) -eq 0
        set _dirs "."
    end

    # the final grep command highlights pattern
    if test (count $argv) -eq 0
        find -L $_dirs $_finddirs -type d ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e 's/^\.\///' -e '/^\$/d'|sort
    else
        find -L $_dirs $_finddirs -type d -iname '*'$argv[1]'*' ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e 's/^\.\///' -e '/^\$/d'|sort|grep --color=auto -i $argv[1]
    end
end

function r
    rg -S --hidden -n -H $argv | fzf -m
end

function f
    _find_objects '!' $argv | fzf -m
end

function d
    _find_objects '' $argv | fzf -m
end

# vi: ft=fish:tw=0:sw=4:ts=4
