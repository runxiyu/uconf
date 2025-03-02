if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function git {
	if [[ "$1" == "push" && "$@" != *"--help"* ]]; then
		shift 1
		command git push -v "$@"
	else
		command git "$@"
	fi
}

alias rawuconf="git --git-dir=$HOME/.local/share/uconf.git --work-tree=$HOME"
function uconf {
	if [[ "$1" == "commit" ]]; then
		shift 1
		rawuconf commit "$@"
	elif [[ "$1" == "add" ]]; then
		shift 1
		rawuconf add "$@"
	elif [[ "$1" == "push" ]]; then
		shift 1
		rawuconf push "$@"
	elif [[ "$1" == "status" ]]; then
		shift 1
		rawuconf status "$@"
	elif [[ "$1" == "pull" ]]; then
		shift 1
		rawuconf pull "$@"
	elif [[ "$1" == "fetch" ]]; then
		shift 1
		rawuconf fetch "$@"
	elif [[ "$1" == "merge" ]]; then
		shift 1
		rawuconf merge "$@"
	elif [[ "$1" == "checkout" ]]; then
		shift 1
		rawuconf checkout "$@"
	elif [[ "$1" == "diff" ]]; then
		shift 1
		rawuconf diff "$@"
	elif [[ "$1" == "log" ]]; then
		shift 1
		rawuconf log "$@"
	elif [[ "$1" == "branch" ]]; then
		shift 1
		rawuconf branch "$@"
	elif [[ -z "$1" ]]; then
		rawuconf status
	else
		printf '%s: unknown command %s\n' "$0" "$1" >&2
	fi
}

export GPG_TTY="$(tty)"

source <(fzf --bash)

PS1="\[\033[1m\]\w \$ \[\033[0m\]"
PS1="\`(tmp=\$?; if [ \$tmp -ne 0 ]; then printf '\\[\\033[31m\\]%d\\[\\033[0m\\] ' \$tmp; fi; exit \$tmp)\`$PS1"

eval "$(zoxide init bash)"

