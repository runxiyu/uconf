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

# PS1='\[\033[1m\]\w $(parse_git_branch)\$ \[\033[0m\]'
PS1='\[\033[1m\]\w \$ \[\033[0m\]'
PS1="\`(tmp=\$?; if [ \$tmp -ne 0 ]; then printf '\\[\\033[31m\\]%d\\[\\033[0m\\] ' \$tmp; fi; exit \$tmp)\`$PS1"

eval "$(zoxide init bash)"

# . "/home/runxiyu/.acme.sh/acme.sh.env"

if [ x"$(uname)" = x"Linux" ]; then
	alias ls="ls --color=auto --group-directories-first"
elif [ x"$(uname)" = x"FreeBSD" ]; then
	alias ls="ls --color=auto"
fi

parse_git_branch() {
	if git rev-parse --git-dir > /dev/null 2>&1; then
		branch=$(git symbolic-ref --short HEAD 2>/dev/null)
		dirty=""
		if ! git diff --quiet --ignore-submodules --cached || ! git diff --quiet --ignore-submodules || [ -n "$(git ls-files --others --exclude-standard)" ]; then
			dirty="*"
		fi
		echo "($branch$dirty) "
	fi
}

