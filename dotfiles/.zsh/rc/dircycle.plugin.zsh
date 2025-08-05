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
		local dir="$(find -L . -mindepth 1 \( -type d -o -type l \) ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null | FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse" $(__fzfcmd))"
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
		local dir="$(find -L . -mindepth 1 -maxdepth 3 \( -type d -o -type l \) ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* 2>/dev/null | FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse" $(__fzfcmd))"
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

	fzEdit() {
		FILES="$(rg -i --files --no-ignore --hidden --follow --glob "!.git/*" 2>/dev/null | FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse -m" $(__fzfcmd))"
		if [ -n "${FILES}" ]; then
			BUFFER='"${EDITOR}" "${FILES[@]}"'
			zle accept-line
			zle reset-prompt
		fi
	}
	zle -N fzEdit
	bindkey '^\' fzEdit

	fzOpen() {
		FILES="$(rg -i --files --no-ignore --hidden --follow --glob "!.git/*" 2>/dev/null | FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse -m" $(__fzfcmd))"
		if [ -n "${FILES}" ]; then
			BUFFER='xdg-open "${FILES[@]}"'
			zle accept-line
			zle reset-prompt
		fi
	}
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
			local dir="$(sed -e "s/:/\\t/" < "${FILE}" | FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_TMUX_HEIGHT:-40%} --reverse" $(__fzfcmd) | sed -ne "s/^[^\t]*\t//p")"
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
