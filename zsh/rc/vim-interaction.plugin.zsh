#
# See README.md
#
# Derek Wyatt (derek@{myfirstnamemylastname}.org
#

function resolveFile
{
	if [ -f "$1" ]; then
		echo $(readlink -f "$1")
	elif [[ "${1#/}" == "$1" ]]; then
		echo "$(pwd)/$1"
	else
		echo $1
	fi
}

function callvim {
	# send commands to vim
	if [[ $# == 0 ]]; then
		cat <<EOH
usage: callvim [-b cmd] [-a cmd] [file ... fileN]

  -b cmd     Run this command in GVIM before editing the first file
  -a cmd     Run this command in GVIM after editing the first file
  file       The file to edit
  ... fileN  The other files to add to the argslist
EOH
	return 0
	fi

	local session="$(vsession)"
	local cmd=""
	local toNormal="<c-\\><c-n>"
	local before=""
	local after=""
	while getopts ":b:a:" option
	do
		case $option in
			a) after="$OPTARG"
				;;
			b) before="$before$OPTARG"
				;;
		esac
	done
	shift $((OPTIND-1))
	if [[ ${after#:} != $after && ${after%<cr>} == $after ]]; then
		after="$after<cr>"
	fi
	if [[ ${before#:} != $before && ${before%<cr>} == $before ]]; then
		before="$before<cr>"
	fi
	local files=""
	for f in $@
	do
		files="$files $(resolveFile $f)"
	done
	if [[ -n $files ]]; then
		files=':args! '"$files<cr>"
	fi
	cmd="$toNormal$before$files$after"
	"$(_choose_vim)" --servername "${session}" --remote-send "$cmd"
	if typeset -f postCallVim > /dev/null; then
		postCallVim
	fi
}

_choose_vim () {
	# select vim executable for execution
	vim=gvim
	if [ -n "${TERM}" ] && [ "${TERM}" != "dumb" ]; then
		if false && [ -e /usr/bin/nvim ]; then
			# neovim doesn't support servers
			vim=nvim
		else
			vim=vim
		fi
	fi
	echo "/usr/bin/${vim}"
}

_vim_new () {
    cmd=("$(_choose_vim)")
	if [ "$1" = '--help' ] || [ "$1" = '-h' ]; then
        cmd+=("$@")
	elif [ $# -ge 1 ]; then
        cmd+=(--servername "$(vsession -n)" "$@")
	else
        cmd+=(--servername "$(vsession -n)")
	fi
    exec "${cmd[@]}"
}

_vim_interactive () {
    cmd=("$(_choose_vim)")
	if [ "$1" = '--help' ] || [ "$1" = '-h' ]; then
        cmd=("$@")
	elif [ "$1" = "-" ]; then
        cmd+=(--servername "$(vsession)" "$@")
	else
		remote=
		if [ $# -ge 1 ]; then
			remote="--remote-silent"
		fi
		session="$(vsession -i)"
		if [ -n "${session}" ]; then
            cmd+=(--servername "${session}" ${remote} "$@")
        else
            cmd=
		fi
	fi
    if [ "${#cmd}" -gt 0 ]; then
        exec "${cmd[@]}"
    fi
}

# always start vim in server mode and use the directory's name as server name
alias v=/usr/bin/vim
compdef v=vim
alias vv=_vim_interactive
compdef vv=vim
alias vvsp="callvim -b':vsp'"
alias vhsp="callvim -b':sp'"
alias vk="callvim -b':wincmd k'"
alias vj="callvim -b':wincmd j'"
alias vl="callvim -b':wincmd l'"
alias vh="callvim -b':wincmd h'"
alias vK="callvim -b':sp<cr>:wincmd k'"
alias vJ="callvim -b':sp<cr>:wincmd j'"
alias vH="callvim -b':vsp<cr>:wincmd h'"
alias vL="callvim -b':vsp<cr>:wincmd l'"
