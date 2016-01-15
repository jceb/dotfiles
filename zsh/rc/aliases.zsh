# global aliases that can be appended to line
alias -g L="|less"
alias -g LL="|& less"
alias -g G="|ag"
alias -g GG="|& ag"
alias -g B="&>/dev/null & disown"

# defaults
alias grep='grep --color=auto --exclude=\*\.svn-base --exclude=\*\~ --exclude=\*\.tmp --binary-files=without-match'
alias o='xdg-open'
alias open='xdg-open'
# on debian based systems this makes the use of ack a bit easier
if [ -e /usr/bin/ack-grep ]; then
	alias ack=ack-grep
fi
alias g='/usr/bin/ag -i'
alias t='tree -f'

# ls
alias ls='ls -b -CF --file-type --color=auto'
alias ltr='ls -ltr'
alias ltra='ls -ltra'
alias l='ls -l --color=auto'

# quilt
alias q='quilt'
alias q+='quilt push -a'
alias qp='quilt push'
alias q-='quilt pop -a'
alias qP='quilt pop'
alias qr='quilt refresh'

# git
alias gs='git st'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gpr='git pre'
alias gps='git subpre'

# aliases for quickly traversing through the Univention SVN
_chdir () {
	if echo "$PWD" | grep -q '/trunk/'; then
		cd "$(echo "$PWD" | sed -e "s#/trunk/#/branches/ucs-$1#")"
	else
		cd "$(echo "$PWD" | sed -e "s#/branches/ucs-[0-9.]*#/branches/ucs-$1#")"
	fi
}
alias cdt='cd $(echo $(pwd)/|sed -e "s#/branches/ucs-[^/]*/#/trunk/#")'
alias cdb2='_chdir 2.0'
alias cdb21='_chdir 2.1'
alias cdb22='_chdir 2.2'
alias cdb23='_chdir 2.3'
alias cdb24='_chdir 2.4'
alias cdb3='_chdir 3.0'
alias cdb31='_chdir 3.1'
alias cdb32='_chdir 3.2'
alias cdb33='_chdir 3.3'
alias cdb4='_chdir 4.0'
alias cdb41='_chdir 4.1'
alias cdd='_chdir'

# jump to the next parent directory containing a debian subdirectory
_ch2parentdir () {
	local _dir _d
	_d="$PWD"
	while [ "$_d" != "/" ]; do
		for _dir in "${@}"; do
			if [ -d "${_d}/${_dir}" ]; then
				echo "$_d"
				return
			fi
		done
		_d="$(dirname "$_d")"
	done
	echo "Directory not found in parent directories: ${@}"  >&2
	return
pwd
}
alias cd.='cd "$(_ch2parentdir debian .git .hg .svn)"'

# aliases for quickly traversing through the directory structures
_glob_match () {
	# $1: pattern; $2: term
	case "$2" in
		*$1*) return 0;;
		*) return 1;;
	esac
}

_seldir () {
	# $1 direction: -1: backward, 0: unlimited forward: >0: limited forward; $2 filter
	local _depth _dirs _d _dn _maxdepth _filter _delfirst
	_depth="$1"
	_filter="$2"
	[ -z "$2" ] && _filter='*' && _delfirst="1d;"
	_maxdepth="-maxdepth"

	# find directories
	if [ "$_depth" = '-1' ]; then
		# traverse backward
		_dirs="$(_d="$PWD"; while [ "$_d" != "/" ]; do
			_d="$(dirname "$_d")"
			if [ -n "$2" ]; then
				_glob_match "$2" "$(basename "$_d")" && echo "$_d"
			else
				echo "$_d"
			fi
		done)"
	else
		# traverse forward
		if [ "$_depth" = '0' ]; then
			_depth=""
			_maxdepth=""
		fi
		_dirs="$(find -L . $_maxdepth $_depth -type d -iname "*${_filter}*" ! -wholename \*/debian/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e "${_delfirst}s/^\.\///"|sort)"
	fi

	# select directory and change into it
	if [ -n "$_dirs" ]; then
		if [ "$(echo "$_dirs" | wc -l)" -eq 1 ]; then
			cd "$_dirs"
		else
			echo $_dirs | awk "{print NR, \$0}">&2
			echo -n "which one? " >&2
			read _d
			_d=$([ -n "$_d" ] && echo $_dirs | awk "NR==$_d {print \$0}")
			if [ -n "$_d" ]; then
				cd "$_d"
			fi
		fi
	fi
}
alias cd-='_seldir -1'
alias cd+='_seldir 0'
alias cd1='_seldir 1'
alias cd2='_seldir 2'
alias cd3='_seldir 3'
alias cd..='cd ..'

# handy functions for searching files and directories
_find_objects () {
	# $1: find directories "" or not "!"; $2: search pattern or search directory if $3 is specified; $3: if sepcified: search pattern
	local _dirs _finddirs
	_finddirs="$1"
	shift
	while [[ $# != 0 ]]; do
		if [[ -d "$1" ]]; then
			_dirs="$_dirs '$1'"
			shift
			continue
		else
			break
		fi
	done
	if [[ -z "${_dirs}" ]]; then
		_dirs="."
	fi
	# the final grep command highlights pattern
	if [[ -z "$@" ]]; then
		eval "find -L $_dirs ${_finddirs} -type d ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e 's/^\.\///' -e '/^$/d'|sort"
		# find $_dirs "${_finddirs}" -type d ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e 's/^\.\///' -e '/^$/d'|sort
	else
		eval "find -L $_dirs ${_finddirs} -type d -iname '*$@*' ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e 's/^\.\///' -e '/^$/d'|sort|grep --color=auto -i '$@'"
		# find $_dirs "${_finddirs}" -type d -iname "*$@*" ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null|sed -e 's/^\.\///' -e '/^$/d'|sort|grep --color=auto -i "$@"
	fi
}

f () {
	_find_objects  '!' "$@"
}

d () {
	_find_objects '' "$@"
}

# vi: ft=zsh:tw=0:sw=4:ts=4
