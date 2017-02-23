##
# dircycle plugin: enables cycling through the directory
# stack using Ctrl+Shift+Left/Right

insert-cycledleft () { pushd -q +0; zle reset-prompt; }
zle -N insert-cycledleft
# M-l
bindkey '^[l' insert-cycledleft
# bindkey 'ì' insert-cycledleft
insert-cycledright () { pushd -q -1; zle reset-prompt; }
zle -N insert-cycledright
# M-h
bindkey '^[h' insert-cycledright
# bindkey 'è' insert-cycledright

cdUp() { cd ..; zle reset-prompt; }
zle -N cdUp
# M-u 7 and 8 bit
bindkey '^[u' cdUp
# bindkey 'õ' cdUp

if type fzf &> /dev/null; then
	fzChDir() {
		setopt localoptions pipefail 2> /dev/null
		local dir="$(FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%}" FZF_DEFAULT_COMMAND="find -L . -mindepth 1 \( -type d -o -type l \) ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\*" $(__fzfcmd))"
		local ret=$?
		if [ -d "${dir}" ]; then
			cd "${dir}"
		else
			ret=1
		fi
		zle reset-prompt
		typeset -f zle-line-init >/dev/null && zle zle-line-init
		return $ret
	}
	zle -N fzChDir
	bindkey '^[N' fzChDir

	fzChDirOne() {
		setopt localoptions pipefail 2> /dev/null
		local dir="$(FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse" FZF_DEFAULT_COMMAND="find -L . -mindepth 1 -maxdepth 3 \( -type d -o -type l \) ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\*" $(__fzfcmd))"
		local ret=$?
		if [ -d "${dir}" ]; then
			cd "${dir}"
		else
			ret=1
		fi
		zle reset-prompt
		typeset -f zle-line-init >/dev/null && zle zle-line-init
		return $ret
	}
	zle -N fzChDirOne
	# M-n
	bindkey '^[n' fzChDirOne
	# bindkey 'î' fzChDirOne

	fzEdit() { BUFFER='FILES=($(FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse -m" $(__fzfcmd))) && "${EDITOR}" "${FILES[@]}"'; zle accept-line }
	zle -N fzEdit
	bindkey '^\' fzEdit

	fzOpen() { BUFFER='FILES=($(FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse -m" $(__fzfcmd))) && xdg-open "${FILES[@]}"'; zle accept-line }
	zle -N fzOpen
	bindkey "^]" fzOpen

	warpDir() {
		local FILE=
		local ret=1
		if test -e "$HOME/.warprc"; then
			FILE="$HOME/.warprc"
		elif test -e "$HOME/.cdargs"; then
			FILE="$HOME/.cdargs"
		fi
		if [ -n "${FILE}" ]; then
			setopt localoptions pipefail 2> /dev/null
			local dir="$(FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse" FZF_DEFAULT_COMMAND="sed -e "s/:/\\\\t/" < '${FILE}'" $(__fzfcmd) | sed -ne "s/^[^\t]*\t//p")"
			local ret=$?
			if [ -d "${dir}" ]; then
				cd "${dir}"
			else
				ret=1
			fi
		fi
		zle reset-prompt
		typeset -f zle-line-init >/dev/null && zle zle-line-init
		return $ret
	}
	zle -N warpDir
	bindkey '^b' warpDir
fi
