#!/usr/bin/env bash
# Author: Jan Christoph Ebersbach <jceb@e-jc.de>
# License: Apache 2
# Last Modified: Wed 13. May 2020 16:52:20 +0200 CEST

set -e
set -u
# set -x

get_current_branch() { # retrieve the current branch's name
	local branch
	branch="$(git rev-parse --abbrev-ref HEAD)"
	if [ "$branch" = "HEAD" ]; then
		branch="$(jj log --no-graph -r 'heads(::@- & bookmarks())' -T 'remote_bookmarks.filter(|b| b.remote() != "git").map(|b| b.name()).join("\n")' | head -n 1)"
		# remote=$(git config "branch.main.remote")
		# if [ -z "${remote}" ] && [ "$1" = "HEAD" ]; then
		# 	remote=$(git config "branch.master.remote")
		# fi
	fi
	echo "$branch"
}

get_file_path() { # return the relative path within the git repository to file or directory
	# $1: file:line_number or directory
	local linnr filename filepath repopath

	if [ $# -ne 1 ]; then
		return 1
	fi
	filename="$(echo "${1}" | sed -e 's/:\([0-9]\+\)$//')"
	if [ -d "${filename}" ]; then
		# special treatment for directories
		repopath="$(readlink -e "$(git rev-parse --show-toplevel)")"
		linnr=
		filepath="${filename:$((${#repopath} + 1))}" # +1 to strip the leading slash that would remain
	elif [ -e "${filename}" ]; then
		cd "$(dirname "${filename}")"
		linnr="$(echo "${1}" | sed -ne 's/.*:\([0-9]\+\)$/#L\1/p')"
		filepath="$(git ls-tree --full-name --name-only HEAD "$(basename "${filename}")" | head -n 1)"
	else
		exit 1
	fi
	echo "${filepath}${linnr}"
}

get_remote_url() { # retrieve the remote URL for the current branch
	# $1: branch name
	local remote

	if [ $# -ne 1 ]; then
		return 1
	fi

	remote=$(git config "branch.${1}.remote")
	if [ -z "$remote" ]; then
		remote="$(jj log --no-graph -r 'heads(::@- & bookmarks())' -T 'remote_bookmarks.filter(|b| b.remote() != "git").map(|b| b.remote()).join("\n")' | head -n 1)"
		# remote=$(git config "branch.main.remote")
		# if [ -z "${remote}" ] && [ "$1" = "HEAD" ]; then
		# 	remote=$(git config "branch.master.remote")
		# fi
	fi
	if [ -n "${remote}" ]; then
		git config "remote.${remote}.url" | sed -e 's/ssh\.dev\.azure\.com:v3/dev.azure.com/' -e '/^git@/s/:/\//'
	fi
}

transform_url() { # convert HTTPS/SSH git URL into the HTTPS URL of the service
	# $1: URL

	if [ $# -ne 1 ]; then
		return 1
	fi
	echo "${1}" | sed -e 's/^git@/https:\/\//' -e 's/\.git$//'
}

build_full_url() { # build URL full including file or directory
	# $1: transformed base URL
	# $2: branch
	# $3: file path
	local path

	if [ $# -ne 3 ]; then
		return 1
	fi
	if [ -z "${3}" ] || test -d "${3}"; then
		path="tree/${2}/${3}"
	else
		path="blob/${2}/${3}"
	fi
	echo "${1}/${path}"
}

main() {
	local file filepath branch remote_url transformed_url

	if [ $# -eq 0 ]; then
		# use current directory if no parameter was provided
		file='.'
	elif [ $# -ne 1 ] || [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then
		echo "USAGE: $(basename "${0}") [FILE[:LINE_NUMBER]|DIRECTORY]"
		echo 'Print the github/gitlab URL to the repository including the passed file or directory name.'
		return 1
	else
		file="${1}"
	fi

	if [ -d "${file}" ]; then
		cd "${file}"
		file=""
	else
		cd "$(dirname "${file}")"
		file="$(basename "${file}")"
	fi
	branch="$(get_current_branch)"
	remote_url="$(get_remote_url "${branch}")"
	transformed_url="$(transform_url "${remote_url}")"
	filepath="$(get_file_path "$(pwd)/${file}")"
	echo $(build_full_url "${transformed_url}" "${branch}" "${filepath}")
}

main "${@}"
