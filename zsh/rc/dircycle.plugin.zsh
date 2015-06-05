##
# dircycle plugin: enables cycling through the directory
# stack using Ctrl+Shift+Left/Right

insert-cycledleft () { pushd -q +1; zle reset-prompt; }
zle -N insert-cycledleft
# M-l
bindkey '^[l' insert-cycledleft
bindkey 'ì' insert-cycledleft
insert-cycledright () { pushd -q -1; zle reset-prompt; }
zle -N insert-cycledright
# M-h
bindkey '^[h' insert-cycledright
bindkey 'è' insert-cycledright

cdUp() { cd ..; zle reset-prompt; }
zle -N cdUp
# M-u 7 and 8 bit
bindkey '^[u' cdUp
bindkey 'õ' cdUp

if type fzf &> /dev/null; then
	fzChDir() { cd "$(find . -mindepth 1 -type d -o -type l ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* | fzf)"; zle reset-prompt; }
	zle -N fzChDir
	bindkey '^f' fzChDir

	fzChDirOne() { cd "$(find . -mindepth 1 -maxdepth 2 -type d -o -type l ! -wholename \*/debian/\*/\* ! -wholename \*/.svn/\* ! -wholename \*/.git/modules/\* ! -wholename \*/.git/objects/\* ! -wholename \*/.hg/\* | fzf)"; zle reset-prompt; }
	zle -N fzChDirOne
	# M-n
	bindkey '^[n' fzChDirOne
	bindkey 'î' fzChDirOne

	fzEdit() { BUFFER='FILES=($(fzf -m)) && vserver "${FILES[@]}"'; zle accept-line }
	zle -N fzEdit
	bindkey '^\' fzEdit
elif type qf &> /dev/null; then
	qfChDir() { cd "$(qf -d -o)"; zle reset-prompt; }
	zle -N qfChDir
	bindkey -r '^f'
	bindkey '^f' qfChDir

	qfEdit() { BUFFER='EDITOR=vserver qf'; zle accept-line }
	zle -N qfEdit
	bindkey '^\' qfEdit
fi

warpDir() {
	FILE=
	if test -e ~/.warprc; then
		FILE=~/.warprc
	elif test -e ~/.cdargs; then
		FILE=~/.cdargs
	fi
	if [ -n "${FILE}" ]; then
		cd "$(sed -e "s/:/\t/" < ${FILE} | fzf | sed -ne "s/^[^\t]*\t//p")"
	fi
	zle reset-prompt
}
zle -N warpDir
bindkey '^b' warpDir
