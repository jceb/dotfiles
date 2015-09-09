# copy files back to the system you were coming from
function sshget () {
	if [ -n "$SSH_CLIENT" ]; then
		user="$USER"
		if [ "$1" = "-l" -o "$1" = "-u" ]; then
			user="$2"
			shift 2
		fi
		scp "$@" "${user}@$(echo "$SSH_CLIENT"|awk '{print $1}')":
	else
		echo "You are not connected with this host via SSH" 1>&2
	fi
}

# vi: ft=zsh:tw=0:sw=4:ts=4
